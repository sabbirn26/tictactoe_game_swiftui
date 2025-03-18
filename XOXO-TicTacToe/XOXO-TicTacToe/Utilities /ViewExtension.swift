//
//  ViewExtension.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 18/3/25.
//

import Foundation
import SwiftUI


struct PopupModifier<PopupContent: View>: ViewModifier {
    // State variables for controlling popup visibility
    let isPresented: Binding<Bool>
    let popupContent: PopupContent
    
    // Customizing the popup layout
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> PopupContent) {
        self.isPresented = isPresented
        self.popupContent = content()
    }

    func body(content: Content) -> some View {
        ZStack {
            // Main content of the view
            content
            
            // Popup overlay
            if isPresented.wrappedValue {
                // Dimming background
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
//                    .onTapGesture {
//                        withAnimation {
//                            isPresented.wrappedValue = false
//                        }
//                    }
                
                // Popup content in the center
                popupContent
                    .frame(width: 320) // You can customize the size
                    .background(Color.clear)
//                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .transition(.scale)
            }
        }
        .animation(.easeInOut, value: isPresented.wrappedValue)
    }
}


extension View {
    // View extension to easily apply the popup modifier
    func popup<PopupContent: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> PopupContent) -> some View {
        self.modifier(PopupModifier(isPresented: isPresented, content: content))
    }
}
