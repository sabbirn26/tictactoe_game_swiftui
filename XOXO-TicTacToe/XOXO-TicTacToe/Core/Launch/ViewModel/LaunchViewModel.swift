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
    
    init() {
        self.loadingText = "Whoever loses is kinda gay...".map { String($0) }
    }
    
    func startTimer(completion: @escaping () -> Void) {
        showLoadingText = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.loopCounterMethod(completion: completion)
        }
    }
    
    private func loopCounterMethod(completion: @escaping () -> Void) {
        withAnimation(.easeInOut(duration: 0.1)) {
            let lastIndex = loadingText.count - 1
            if counter == lastIndex {
                counter = 0
                loops += 1
                
                if loops >= 1 {
                    timer?.invalidate()
                    completion()  // Call completion handler to change `showLaunchView`
                }
            } else {
                counter += 1
            }
        }
    }
}

