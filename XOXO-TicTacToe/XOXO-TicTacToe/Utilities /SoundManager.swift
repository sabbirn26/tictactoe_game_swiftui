//
//  SoundManager.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 18/3/25.
//

import Foundation
import AVKit

class SoundManager: ObservableObject {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption : String {
        case x_sound
        case o_sound
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}
