//
//  TicTacToeModel.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 31/10/24.
//

import Foundation

import SwiftUI
struct TicTacToeModel {
    var board = Array(repeating: "", count: 9)
    let crossSymbol = "x" // Image name
    let zeroSymbol = "o"   // Image name
    var currentTurn: Turn = .cross
    
    enum Turn {
        case cross, zero
    }
}


