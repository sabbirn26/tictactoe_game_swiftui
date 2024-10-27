//
//  ContentView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 27/10/24.
//

import SwiftUI

struct ContentView: View {
    enum Turn {
        case zero
        case cross
    }
    @State private var board: [String] = Array(repeating: "", count: 9)
    @State private var currentTurn = Turn.cross
    @State private var turnLabel = "X"
    let ZERO = "O"
    let CROSS = "X"
    var body: some View {
        ZStack{
            Color.cyan.ignoresSafeArea()
            VStack{
                turnView
                Spacer()
                gameView
                Spacer()
                storeView
            }
        }
    }
}
extension ContentView{
    private var turnView : some View{
        VStack{
            Text("TURN: \(turnLabel)")
                .font(.largeTitle.bold())
            
            HStack{
                Spacer()
            }
        }
        .padding(.horizontal)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
    
    private var gameView : some View{
        VStack {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3),
                spacing: 10
            ) {
                ForEach(0..<9) { index in
                    Button(action: {
                        print("Button no \(index) pressed!")
                        boardTapAction(index)
                    }) {
                        Text(board[index])
                            .font(.system(size: 60))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.9))
                            .cornerRadius(10)
                    }
                    .disabled(board[index] != "")
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
        
    }
    
    private var storeView : some View{
        VStack{
            VStack{
                Text("SCORE")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                HStack{
                    Spacer()
                    Text("P1--")
                        .font(.title.bold())
                        .foregroundColor(.black)
                    Text("0")
                        .font(.title.bold())
                        .foregroundColor(.black)
                    Text(":")
                        .font(.title.bold())
                        .foregroundColor(.black)
                    Text("0")
                        .font(.title.bold())
                        .foregroundColor(.black)
                    Text("--P2")
                        .font(.title.bold())
                        .foregroundColor(.black)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
    
    
    //MARK: Function Part
    func boardTapAction(_ index: Int) {
        if board[index] == "" {
            //give the desired turn
            if currentTurn == .cross {
                board[index] = CROSS
                currentTurn = .zero
                turnLabel = ZERO
            } else {
                board[index] = ZERO
                currentTurn = .cross
                turnLabel = CROSS
            }
            

            
        }
    }
    
    
}
#Preview {
    ContentView()
}
