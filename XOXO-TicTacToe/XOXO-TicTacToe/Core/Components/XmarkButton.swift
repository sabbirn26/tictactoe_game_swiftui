//
//  XmarkButton.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

/// A custom button view that displays an "X" (close) icon.
/// This button is typically used to dismiss a bottom sheet or modal.
struct XmarkButton: View {
    /// Closure to handle the dismissal action.
    let dismiss: () -> Void
    
    var body: some View {
        Button(action: {
            // Print a message to the console when the button is tapped.
            print("❌ Portfolio bottom sheet dismissed!")
            // Call the dismiss closure to perform the actual dismissal.
            dismiss()
        }, label: {
            Image(systemName: "xmark") // Use the "xmark" system image.
                .font(.headline) // Set the font size to headline.
                .fontWeight(.heavy) // Make the font weight heavy for better visibility.
                .foregroundStyle(Color.white) // Set the icon color to white.
        })
    }
}

/// A preview of the `XmarkButton` for SwiftUI's canvas.
#Preview {
    XmarkButton(dismiss: {})
}


