//
//  LaunchView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Whoever loses is kinda gay...".map{ String($0) }
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            logoSection
            
            ZStack{
                if showLoadingText {
                    gameTitleSection
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            loopCounterMethod()
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}

extension LaunchView {
    //MARK: VIEW PART
    private var logoSection : some View {
        Image("logo")
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    private var gameTitleSection : some View {
        HStack(spacing: 0){
            ForEach(loadingText.indices) { index in
                Text(loadingText[index])
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.blue)
                    .offset(y: counter == index ? -5 : 0)
            }
        }
        .transition(AnyTransition.scale.animation(.easeIn))
    }
    
    //MARK: METHODS
    private func loopCounterMethod(){
        withAnimation(.spring()){
            let lastIndex = loadingText.count - 1
            if counter == lastIndex {
                counter = 0
                loops += 1
                
                if loops >= 1 {
                    showLaunchView = false
                }
            } else {
                counter += 1
            }
        }
    }
}

