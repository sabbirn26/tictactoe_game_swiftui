//
//  HapticManager.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 21/1/25.
//

import Foundation
import SwiftUI

class HapticManager {
    // A private haptic feedback generator instance (because we don't want everyone messing with it 😉)
    static private let generator = UINotificationFeedbackGenerator()
    
    /// Triggers a haptic notification feedback.
    /// - Parameter type: The type of haptic feedback (success, warning, error).
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        print("🔔 Haptic feedback triggered: \(type)")
        generator.notificationOccurred(type)
    }
}

