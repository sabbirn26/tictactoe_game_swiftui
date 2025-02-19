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
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.6), .purple.opacity(0.6)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    HStack {
                        CircleButtonView(iconName: "info")
                            .onTapGesture {
                                print("ℹ️ Settings button tapped")
                                viewModel.showSettingsView.toggle()
                            }
                        .animation(.none)
                        Spacer()
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .frame(width:40, height: 40)
                            .padding()
                    }
                    turnView
                    Spacer()
                    gameView
                    Spacer()
                    scoreView
                }
            }
            .alert(isPresented: $viewModel.showResult) {
                print("🎉 Showing result alert: \(viewModel.resultTitle)")
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
            .sheet(isPresented: $viewModel.showSettingsView, content: {
                SettingsView()
            })
        }
    }
    
    private var turnView: some View {
        HStack {
            Spacer()
            Text("TURN:")
            Image(viewModel.turnLabel == "X" ? "x" : "o")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Spacer()
        }
        .font(.headline)
        .fontWeight(.heavy)
        .padding()
        .background(.ultraThinMaterial)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
    
    private var gameView: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(0..<9, id: \.self) { index in
                    Button(action: {
                        print("🎯 Tile tapped at index \(index)")
                        viewModel.boardTapAction(index)
                        HapticManager.notification(type: .warning)
                    }) {
                        ZStack {
                            Color.white.opacity(0.7)
                                .cornerRadius(10)
                                .aspectRatio(1, contentMode: .fit)
                                .shadow(radius: 3)
                            
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
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
    
    private var scoreView: some View {
        VStack {
            Text("SCORE")
                .underline(true, color: .blue)
            HStack {
                Spacer()
                Image("x")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("---")
                    .font(.title.bold())
                    .foregroundColor(.black)
                Text("\(viewModel.crossScore)")
                    .font(.title.bold())
                    .foregroundColor(viewModel.crossScore == 0 ? .gray : .green)
                Text(":")
                    .font(.title.bold())
                    .foregroundColor(.black)
                Text("\(viewModel.zeroScore)")
                    .font(.title.bold())
                    .foregroundColor(viewModel.zeroScore == 0 ? .gray : .green)
                Text("---")
                    .font(.title.bold())
                    .foregroundColor(.black)
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
        .background(.ultraThinMaterial)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    HomeView()
}
