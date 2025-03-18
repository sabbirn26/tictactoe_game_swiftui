//
//  TicTacToeViewModel.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 31/10/24.
//

import SwiftUI

class TicTacToeViewModel: ObservableObject {
    @Published var model = TicTacToeModel()
    @Published var turnLabel = "X" // Displays the current player's turn
    @Published var zeroScore = 0 // Score for 'O'
    @Published var crossScore = 0 // Score for 'X'
    @Published var showResult = false // Controls result popup visibility
    @Published var resultTitle = "" // Stores result message
    @Published var showSettingsView: Bool = false // Controls settings view visibility

    /// Handles a player's move on the board
    func boardTapAction(_ index: Int) {
        guard model.board[index] == "" else {
            print("❌ Invalid move! Cell \(index) is already occupied.")
            return
        }
        
        if model.currentTurn == .cross {
            model.board[index] = model.crossSymbol
            model.currentTurn = .zero
            turnLabel = "O"
            print("✖️ 'X' placed at index \(index). Next turn: 'O'")
            SoundManager.instance.playSound(sound: .o_sound)
        } else {
            model.board[index] = model.zeroSymbol
            model.currentTurn = .cross
            turnLabel = "X"
            print("⭕ 'O' placed at index \(index). Next turn: 'X'")
            SoundManager.instance.playSound(sound: .x_sound)
        }
        
        checkForResult() // Check if the game has ended
    }
    
    /// Checks if there's a winner or a draw
    private func checkForResult() {
        if checkVictory(for: model.zeroSymbol) {
            zeroScore += 1
            resultTitle = "Zero Wins! 🎉"
            showResult = true
            HapticManager.notification(type: .success)
            print("🏆 'O' Wins! Score - O: \(zeroScore), X: \(crossScore)")
        } else if checkVictory(for: model.crossSymbol) {
            crossScore += 1
            resultTitle = "Cross Wins! 🎉"
            showResult = true
            HapticManager.notification(type: .success)
            print("🏆 'X' Wins! Score - X: \(crossScore), O: \(zeroScore)")
        } else if checkFullBoard() {
            resultTitle = "It's a Draw! 🤝"
            showResult = true
            HapticManager.notification(type: .error)
            print("🤝 It's a Draw!")
        }
    }
    
    /// Checks if a player has a winning combination
    private func checkVictory(for player: String) -> Bool {
        let winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal wins
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical wins
            [0, 4, 8], [2, 4, 6]             // Diagonal wins
        ]
        
        let isWin = winningCombinations.contains { combination in
            combination.allSatisfy { model.board[$0] == player }
        }
        
        if isWin { print("🎉 \(player) has a winning combination!") }
        return isWin
    }
    
    /// Checks if the board is full (no empty spaces left)
    private func checkFullBoard() -> Bool {
        let isFull = !model.board.contains("")
        if isFull { print("⚠️ The board is full!") }
        return isFull
    }
    
    /// Resets the board while keeping the score
    func resetBoard() {
        model.board = Array(repeating: "", count: 9)
        model.currentTurn = .cross
        turnLabel = "X"
        print("🔄 Board reset! Scores remain - X: \(crossScore), O: \(zeroScore)")
    }
    
    /// Fully restarts the game, resetting both board and scores
    func restartGame() {
        resetBoard()
        zeroScore = 0
        crossScore = 0
        print("🔁 Game restarted! Scores reset to zero.")
    }
}
