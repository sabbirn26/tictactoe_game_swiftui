//
//  TicTacToeModel.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 31/10/24.
//

import Foundation

struct TicTacToeModel {
    enum Turn {
        case zero
        case cross
    }
    
    let zeroSymbol = "O"
    let crossSymbol = "X"
    var board: [String] = Array(repeating: "", count: 9)
    var currentTurn: Turn = .cross
}

