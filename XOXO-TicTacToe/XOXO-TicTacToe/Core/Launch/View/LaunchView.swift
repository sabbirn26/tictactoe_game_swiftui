//
//  LaunchView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

struct LaunchView: View {
    @StateObject private var vm: LaunchViewModel
    
    init(showLaunchView: Binding<Bool>) {
        _vm = StateObject(wrappedValue: LaunchViewModel(showLaunchView: showLaunchView))
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            logoSection
            
            ZStack {
                if vm.showLoadingText {
                    gameTitleSection
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            vm.startTimer()
        }
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
    
    private var gameTitleSection: some View {
        HStack(spacing: 0) {
            ForEach(vm.loadingText.indices, id: \ .self) { index in
                Text(vm.loadingText[index])
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.blue)
                    .offset(y: vm.counter == index ? -5 : 0)
            }
        }
        .transition(AnyTransition.scale.animation(.easeIn))
    }
}

