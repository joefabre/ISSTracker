//
//  SpeechManager.swift
//  ISSTracker
//
//  Created by Joe Fabre on 3/3/25.
//

import AVFoundation

class SpeechManager {
    private let speechSynthesizer = AVSpeechSynthesizer()

    func speak(_ message: String) {
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(utterance)
    }
}
