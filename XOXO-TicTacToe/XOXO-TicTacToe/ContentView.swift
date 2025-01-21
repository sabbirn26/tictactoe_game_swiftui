import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TicTacToeViewModel()
    
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
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
            HStack{
                Spacer()
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
//        relevant?
    }
    
    private var gameView: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(0..<9, id: \.self) { index in
                    Button(action: {
                        viewModel.boardTapAction(index)
                    }) {
                        Text(viewModel.model.board[index])
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.red)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.9))
                            .cornerRadius(10)
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
    ContentView()
}

