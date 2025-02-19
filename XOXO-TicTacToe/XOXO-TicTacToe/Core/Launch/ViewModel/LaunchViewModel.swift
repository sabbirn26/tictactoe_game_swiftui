//
//  LaunchViewModel.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import Foundation
import SwiftUI

class LaunchViewModel: ObservableObject {
    @Published var loadingText: [String]
    @Published var showLoadingText: Bool = false
    @Published var counter: Int = 0
    @Published var loops: Int = 0
    private var timer: Timer?
    @Binding var showLaunchView: Bool
    
    init(showLaunchView: Binding<Bool>) {
        self._showLaunchView = showLaunchView
        self.loadingText = "Whoever loses is kinda gay...".map { String($0) }
    }
    
    func startTimer() {
        showLoadingText = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.loopCounterMethod()
        }
    }
    
    private func loopCounterMethod() {
        withAnimation(.spring()) {
            let lastIndex = loadingText.count - 1
            if counter == lastIndex {
                counter = 0
                loops += 1
                
                if loops >= 1 {
                    showLaunchView = false
                    timer?.invalidate()
                }
            } else {
                counter += 1
            }
        }
    }
}
