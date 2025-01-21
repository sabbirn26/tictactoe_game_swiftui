//
//  HapticManager.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 21/1/25.
//

import Foundation
import SwiftUI

class HapticManager{
  static private let generator = UINotificationFeedbackGenerator()
   
  static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
    generator.notificationOccurred(type)
  }
}
