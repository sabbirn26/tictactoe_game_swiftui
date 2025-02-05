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
            .foregroundColor(.white)
            .frame(width:40, height: 40)
            .background{
                Circle()
                    .foregroundColor(.blue.opacity(0.5))
                    .shadow(radius: 20, y: 10)
            }
            .shadow(color: .black,radius: 10)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "info")
}
