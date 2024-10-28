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
    @State private var zeroScore = 0
    @State private var crossScore = 0
    @State private var showResult = false
    @State private var resultTitle = ""
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
        .alert(isPresented: $showResult) {
            Alert(
                title: Text(resultTitle),
                message: Text("Zero: \(zeroScore) Cross: \(crossScore)"),
                primaryButton: .default(Text("PLAY MORE")){
                    resetBoardMethod()
                },
                secondaryButton: .destructive(Text("RESTART")){
                    startOverTheGameMethod()
                }
            )
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
        .padding(.vertical)
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
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.red)
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
        .padding(.vertical)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
        
    }
    
    private var storeView : some View{
        VStack{
            VStack{
                Text("SCORE")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                HStack{
                    Spacer()
                    Text("O--")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Text("\(zeroScore)")
                        .font(.title.bold())
                        .foregroundColor(.red)
                    Text(":")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Text("\(crossScore)")
                        .font(.title.bold())
                        .foregroundColor(.red)
                    Text("--X")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
    
    
    //MARK: Function Part
    
    //board tap method
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
            
            //checking winning
            if checkVictoryMethod(ZERO) {
                zeroScore += 1
                resultTitle = "Zero Win!"
                showResult = true
            } else if checkVictoryMethod(CROSS) {
                crossScore += 1
                resultTitle = "Cross Win!"
                showResult = true
            } else if checkFullBoardMethod() {
                resultTitle = "DRAW!"
                showResult = true
            }
        }
    }
    
    //MARK: Check who won zero or cross method
    func checkVictoryMethod(_ player: String) -> Bool {
        //vertical logics
        if board[0] == player && board[1] == player && board[2] == player {
            return true
        } else if board[3] == player && board[4] == player && board[5] == player{
            return true
        } else if board[6] == player && board[7] == player && board[8] == player{
            return true
        } 
        //horizontal logics
        else if board[0] == player && board[3] == player && board[6] == player{
            return true
        } else if board[1] == player && board[4] == player && board[7] == player{
            return true
        }else if board[2] == player && board[5] == player && board[8] == player{
            return true
        }
        //cross logics
        else if board[0] == player && board[4] == player && board[8] == player{
            return true
        }else if board[2] == player && board[4] == player && board[6] == player{
            return true
        }
        
        return false
    }
    
    //check draw method
    func checkFullBoardMethod() -> Bool{
        if board.contains("") == false{
            return true
        }
        
        return false
    }
    
    //reset the board after win method
    func resetBoardMethod() {
        board = Array(repeating: "", count: 9)
        currentTurn = .cross
        turnLabel = CROSS
    }
    
    //func start over method
    func startOverTheGameMethod() {
        board = Array(repeating: "", count: 9)
        currentTurn = .cross
        turnLabel = CROSS
        zeroScore = 0
        crossScore = 0
    }
}
#Preview {
    ContentView()
}
