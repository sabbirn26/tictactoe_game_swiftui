//
//  XmarkButton.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

struct XmarkButton: View {
    let dismiss: () -> Void
    
    var body: some View {
        Button(action: {
            print("❌ Portfolio bottom sheet dismissed!")
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
        })
    }
}

#Preview {
    XmarkButton(dismiss: {})
}

