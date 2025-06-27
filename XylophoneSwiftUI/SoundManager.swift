//
//  SoundManager.swift
//  XylophoneSwiftUI
//
//  Created by Elfo on 27/06/2025.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    private init() {}
    
    private var sounds: [String: AVAudioPlayer] = [:]
    
    func playSound(named: String) {
        let player: AVAudioPlayer
        
        do {
            let url = Bundle.main.url(forResource: named, withExtension: "wav")!
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error {
            print("Error when playing sound: \(error)")
            return
        }
        
        sounds[named] = player
        player.play()
    }
}
