//
//  TicTacToeViewModel.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 31/10/24.
//

import SwiftUI

class TicTacToeViewModel: ObservableObject {
    @Published var model = TicTacToeModel()
    @Published var turnLabel = "X"
    @Published var zeroScore = 0
    @Published var crossScore = 0
    @Published var showResult = false
    @Published var resultTitle = ""

    // Tap action on board
    func boardTapAction(_ index: Int) {
        guard model.board[index] == "" else { return }
        
        if model.currentTurn == .cross {
            model.board[index] = model.crossSymbol
            model.currentTurn = .zero
            turnLabel = model.zeroSymbol
        } else {
            model.board[index] = model.zeroSymbol
            model.currentTurn = .cross
            turnLabel = model.crossSymbol
        }
        
        checkForResult()
    }
    
    private func checkForResult() {
        if checkVictory(for: model.zeroSymbol) {
            zeroScore += 1
            resultTitle = "Zero Wins!"
            showResult = true
            HapticManager.notification(type: .success)
        } else if checkVictory(for: model.crossSymbol) {
            crossScore += 1
            resultTitle = "Cross Wins!"
            showResult = true
            HapticManager.notification(type: .success)
        } else if checkFullBoard() {
            resultTitle = "Draw!"
            showResult = true
            HapticManager.notification(type: .error)
        }
    }
    
    private func checkVictory(for player: String) -> Bool {
        let winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
            [0, 4, 8], [2, 4, 6]             // Diagonal
        ]
        
        return winningCombinations.contains { combination in
            combination.allSatisfy { model.board[$0] == player }
        }
    }
    
    private func checkFullBoard() -> Bool {
        !model.board.contains("")
    }
    
    func resetBoard() {
        model.board = Array(repeating: "", count: 9)
        model.currentTurn = .cross
        turnLabel = model.crossSymbol
    }
    
    func restartGame() {
        resetBoard()
        zeroScore = 0
        crossScore = 0
    }
}

