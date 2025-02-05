//
//  HomeView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 27/10/24.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = TicTacToeViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue.opacity(0.6), .purple.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                turnView
                Spacer()
                gameView
                Spacer()
                scoreView
            }
        }
        .alert(isPresented: $viewModel.showResult) {
            Alert(
                title: Text(viewModel.resultTitle),
                message: Text("Zero: \(viewModel.zeroScore) Cross: \(viewModel.crossScore)"),
                primaryButton: .default(Text("Play Again")) {
                    viewModel.resetBoard()
                },
                secondaryButton: .destructive(Text("Restart Game")) {
                    viewModel.restartGame()
                }
            )
        }
    }
    
    private var turnView: some View {
        VStack {
            Text("Turn: \(viewModel.turnLabel)")
                .font(.largeTitle.bold())
            HStack {
                Spacer()
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
    
    private var gameView: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(0..<9, id: \.self) { index in
                    Button(action: {
                        viewModel.boardTapAction(index)
                        HapticManager.notification(type: .warning)
                    }) {
                        ZStack {
                            Color.white.opacity(0.9)
                                .cornerRadius(10)
                                .aspectRatio(1, contentMode: .fit)
                            
                            if !viewModel.model.board[index].isEmpty {
                                Image(viewModel.model.board[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                            }
                        }
                    }
                    .disabled(viewModel.model.board[index] != "")
                }
            }
            .padding()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
    
    private var scoreView: some View {
        VStack {
            Text("Score")
                .font(.title2.bold())
                .foregroundColor(.white)
            HStack {
                Spacer()
                Text("O: -- \(viewModel.zeroScore)")
                    .font(.title.bold())
                    .foregroundColor(.red)
                Text(":")
                    .font(.title.bold())
                    .foregroundColor(.green)
                Text("\(viewModel.crossScore) -- :X")
                    .font(.title.bold())
                    .foregroundColor(.red)
                Spacer()
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    HomeView()
}
