//
//  TicTacToeModel.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 31/10/24.
//

import Foundation
import SwiftUI

struct TicTacToeModel {
    // The tic-tac-toe board, initialized with empty strings (because we start fresh!)
    var board = Array(repeating: "", count: 9)
    
    // Symbols for the players (these can be image names)
    let crossSymbol = "x"  // ❌ The mighty cross!
    let zeroSymbol = "o"   // ⭕ The sneaky zero!
    
    // Keep track of whose turn it is (starting with cross)
    var currentTurn: Turn = .cross

    enum Turn {
        case cross, zero
    }
    
    /// Prints the current board state in a fun way!
    func printBoard() {
        print("🎲 Current Board State:")
        for i in stride(from: 0, to: 9, by: 3) {
            print("\(board[i]) | \(board[i+1]) | \(board[i+2])")
        }
        print("👉 Next turn: \(currentTurn == .cross ? "❌ Cross" : "⭕ Zero")")
    }
}


