//
//  HomeView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 27/10/24.
//

import SwiftUI

/// The main home view for the Tic Tac Toe game.
struct HomeView: View {
    /// ViewModel that manages the game state.
    @StateObject private var viewModel = TicTacToeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient effect
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.6), .purple.opacity(0.6)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    // Top navigation bar with settings button and logo
                    HStack {
                        CircleButtonView(iconName: "info")
                            .onTapGesture {
                                print("ℹ️ Settings button tapped")
                                viewModel.showSettingsView.toggle()
                            }
                        .animation(.none)
                        Spacer()
                        
                        // Logo image
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .frame(width: 40, height: 40)
                            .padding()
                    }
                    
                    // Displays the current player's turn
                    turnView
                    Spacer()
                    
                    // Game board (grid of buttons for Tic Tac Toe)
                    gameView
                    Spacer()
                    
                    // Score display
                    scoreView
                }
            }
            // Alert to show game results
            .alert(isPresented: $viewModel.showResult) {
                print("🎉 Showing result alert: \(viewModel.resultTitle)")
                SoundManager.instance.playSound(sound: .win_sound)
                return Alert(
                    title: Text(viewModel.resultTitle),
                    message: Text("Zero: \(viewModel.zeroScore) Cross: \(viewModel.crossScore)"),
                    primaryButton: .default(Text("Play Again")) {
                        print("🔄 Resetting board for a new round")
                        viewModel.resetBoard()
                    },
                    secondaryButton: .destructive(Text("Restart Game")) {
                        print("🔁 Restarting game with reset scores")
                        viewModel.restartGame()
                    }
                )
            }
//            .popup(isPresented: $viewModel.showResult, content: {
//                <#code#>
//            })
            // Settings sheet popup
            .sheet(isPresented: $viewModel.showSettingsView, content: {
                SettingsView()
            })
        }
    }
    
    /// Displays whose turn it is (X or O).
    private var turnView: some View {
        HStack {
            Spacer()
            Text("TURN:")
            Image(viewModel.turnLabel == "X" ? "x" : "o") // Show X or O based on turn
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Spacer()
        }
        .font(.headline)
        .fontWeight(.heavy)
        .padding()
        .background(.ultraThinMaterial) // Semi-transparent background
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
    
    /// The game board, consisting of a 3x3 grid of tappable buttons.
    private var gameView: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(0..<9, id: \.self) { index in
                    Button(action: {
                        print("🎯 Tile tapped at index \(index)")
                        viewModel.boardTapAction(index) // Handle board tap action
                        HapticManager.notification(type: .warning) // Provide haptic feedback
                        
                        
                    }) {
                        ZStack {
                            Color.white.opacity(0.7)
                                .cornerRadius(10)
                                .aspectRatio(1, contentMode: .fit)
                                .shadow(radius: 3)
                            
                            // Show "X" or "O" if the tile is occupied
                            if !viewModel.model.board[index].isEmpty {
                                Image(viewModel.model.board[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                            }
                        }
                    }
                    .disabled(viewModel.model.board[index] != "") // Disable already occupied tiles
                }
            }
            .padding()
        }
        .background(.ultraThinMaterial) // Semi-transparent background
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
    
    /// Displays the score for both players (X and O).
    private var scoreView: some View {
        VStack {
            Text("SCORE")
                .underline(true, color: .blue)
            
            HStack {
                Spacer()
                
                // X player score
                Image("x")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Text("---")
                    .font(.title.bold())
                    .foregroundColor(.black)
                
                // X player's score with conditional coloring
                Text("\(viewModel.crossScore)")
                    .font(.title.bold())
                    .foregroundColor(viewModel.crossScore == 0 ? .gray : .green)
                
                Text(":")
                    .font(.title.bold())
                    .foregroundColor(.black)
                
                // O player's score with conditional coloring
                Text("\(viewModel.zeroScore)")
                    .font(.title.bold())
                    .foregroundColor(viewModel.zeroScore == 0 ? .gray : .green)
                
                Text("---")
                    .font(.title.bold())
                    .foregroundColor(.black)
                
                // O player score
                Image("o")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Spacer()
            }
        }
        .font(.headline)
        .fontWeight(.heavy)
        .padding()
        .background(.ultraThinMaterial) // Semi-transparent background
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

/// SwiftUI preview for development testing.
#Preview {
    HomeView()
}

