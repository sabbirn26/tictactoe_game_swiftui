//
//  LaunchView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

/// A view that displays a launch screen with a logo and an animated game title.
struct LaunchView: View {
    /// ViewModel that handles the loading animation logic.
    @StateObject private var vm: LaunchViewModel
    
    /// Initializes the launch view with a binding to control its visibility.
    /// - Parameter showLaunchView: A binding that determines when to dismiss the launch view.
    init(showLaunchView: Binding<Bool>) {
        _vm = StateObject(wrappedValue: LaunchViewModel(showLaunchView: showLaunchView))
    }
    
    var body: some View {
        ZStack {
            // Background color
            Color.black
                .ignoresSafeArea()
            
            // Displays the logo at the center of the screen
            logoSection
            
            // Conditionally displays the animated game title if `showLoadingText` is true
            ZStack {
                if vm.showLoadingText {
                    gameTitleSection
                }
            }
            .offset(y: 70) // Moves the text slightly down
        }
        .onAppear {
            // Starts the animation timer when the view appears
            vm.startTimer()
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}

extension LaunchView {
    // MARK: - View Components
    
    /// Displays the logo in the launch screen.
    private var logoSection: some View {
        Image("logo")
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    /// Displays the animated loading text with character-by-character movement.
    private var gameTitleSection: some View {
        HStack(spacing: 0) {
            // Loops through each character in the loading text and displays it.
            ForEach(vm.loadingText.indices, id: \.self) { index in
                Text(vm.loadingText[index])
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.blue)
                    .offset(y: vm.counter == index ? -5 : 0) // Moves the current character slightly up
            }
        }
        .transition(AnyTransition.scale.animation(.easeIn)) // Adds a scaling effect during transition
    }
}
