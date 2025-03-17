//
//  LaunchViewModel.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import Foundation
import SwiftUI

/// ViewModel responsible for managing the launch screen animation.
class LaunchViewModel: ObservableObject {
    /// Array of characters from the loading text.
    @Published var loadingText: [String]
    
    /// Boolean flag to determine whether to show loading text animation.
    @Published var showLoadingText: Bool = false
    
    /// Counter to keep track of the current character index in the loading text animation.
    @Published var counter: Int = 0
    
    /// Keeps track of how many times the loading text animation has looped.
    @Published var loops: Int = 0
    
    /// Timer object to handle loading animation.
    private var timer: Timer?
    
    /// Binding property to determine whether to show the launch view.
    @Binding var showLaunchView: Bool
    
    /// Initializes the ViewModel and sets up the loading text.
    /// - Parameter showLaunchView: A binding to control when the launch view is dismissed.
    init(showLaunchView: Binding<Bool>) {
        self._showLaunchView = showLaunchView
        // Splitting the text into an array of individual characters for animation.
        self.loadingText = "Whoever loses is kinda gay...".map { String($0) }
    }
    
    /// Starts the loading text animation timer.
    func startTimer() {
        showLoadingText = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.loopCounterMethod()
        }
    }
    
    /// Handles the animation logic for displaying the loading text.
    private func loopCounterMethod() {
        withAnimation(.spring()) {
            let lastIndex = loadingText.count - 1
            
            if counter == lastIndex {
                // Reset counter and increment loop count
                counter = 0
                loops += 1
                
                // If the animation has completed at least one loop, dismiss the launch view.
                if loops >= 1 {
                    showLaunchView = false
                    timer?.invalidate() // Stop the timer
                }
            } else {
                // Move to the next character in the animation
                counter += 1
            }
        }
    }
}
