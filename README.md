# XOXO - Tic Tac Toe Game

A beautifully designed Tic Tac Toe game built with SwiftUI. This project demonstrates modern iOS development practices including MVVM architecture, haptic feedback, sound effects, and a polished user interface.

Screenshots 📱
<table>
  <tr>
    <td align="center">
      <img src="/screenshots/home.png" width="250" alt="Home View"/><br/>
      <em>Home View</em>
    </td>
    <td align="center">
      <img src="/screenshots/win_draw.png" width="250" alt="Scoreboard View"/><br/>
      <em>Scoreboard View</em>
    </td>
    <td align="center">
      <img src="/screenshots/settings.png" width="250" alt="Settings View"/><br/>
      <em>Settings View</em>
    </td>
  </tr>
</table>

## Features

- 🎮 Classic Tic Tac Toe gameplay for two players
- 📊 Score tracking across multiple games
- 🔄 Options to play again or restart with reset scores
- 🎵 Sound effects for gameplay actions
- 📳 Haptic feedback for enhanced user experience
- 🌈 Beautiful gradient UI with glass-like elements
- ⚙️ Settings screen with developer information
- 💾 MVVM architecture for clean code organization

## Technical Details

### Architecture

This project follows the MVVM (Model-View-ViewModel) architecture pattern:

- **Model**: `TicTacToeModel` contains the game's core data structures and rules
- **View**: `HomeView` and `SettingsView` handle UI representation
- **ViewModel**: `TicTacToeViewModel` manages game state and business logic

### UI Components

- Custom gradient backgrounds for visual appeal
- Glass-like UI elements using `.ultraThinMaterial`
- Custom button components for reusability
- Responsive grid layout that works across device sizes
- Animated transitions and feedback

### User Experience

The app prioritizes user experience through:
- Immediate visual feedback when making moves
- Sound effects that correspond to game actions
- Haptic feedback to enhance physical interaction
- Clear score tracking and game state information
- Intuitive controls and navigation

## Implementation Highlights

### Game Logic
```swift
private func checkVictory(for player: String) -> Bool {
    let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal wins
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical wins
        [0, 4, 8], [2, 4, 6]             // Diagonal wins
    ]
    
    return winningCombinations.contains { combination in
        combination.allSatisfy { model.board[$0] == player }
    }
}
```

### Haptic Feedback
```swift
static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    generator.notificationOccurred(type)
}
```

### Sound Management
```swift
func playSound(sound: SoundOption) {
    guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
    
    do {
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()
    } catch let error {
        print("Error playing sound. \(error.localizedDescription)")
    }
}
```

## Setup and Requirements

### Requirements
- iOS 16.0+
- Xcode 15.0+
- Swift 5.9+

### Installation
1. Clone this repository
2. Open `XOXO-TicTacToe.xcodeproj` in Xcode
3. Build and run on your device or simulator

## Future Enhancements

- 🤖 AI opponent with adjustable difficulty levels
- 🌐 Multiplayer mode over local network
- 🏆 Persistent leaderboard with game history
- 🎨 Customizable themes and game pieces
- ⏱️ Game timer and turn limits

## About the Developer

Created by [Sabbir Nasir](https://github.com/sabbirn26) as part of a SwiftUI learning journey. Connect with me on [LinkedIn](https://www.linkedin.com/in/sabbirn26/).

## License

This project is available under the MIT License. See the LICENSE file for more info.
