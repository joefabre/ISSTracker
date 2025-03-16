//
//  SoundManager.swift
//  ISSTracker
//
//  Created by Joe Fabre on 3/16/25.
//

// SoundManager.swift
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?

    private init() {}

    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
