//
//  CircleButtonView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName : String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.clear)
            .frame(width: 50, height: 50)
            .background{
                Circle()
                    .foregroundColor(.clear)
            }
            .shadow(radius: 10)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "info")
}
