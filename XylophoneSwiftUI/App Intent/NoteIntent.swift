//
//  NoteIntent.swift
//  XylophoneSwiftUI
//
//  Created by Elfo on 25/06/2025.
//

import Foundation
import AppIntents
import WidgetKit
import AVFoundation

struct NoteIntent: AudioPlaybackIntent {
    
    static var title: LocalizedStringResource = "Play Note"
    static var description = IntentDescription("Play a sound")
    
    @Parameter(title: "note")
    var note: String
    
    init() {}
    
    init(note: String) {
        self.note = note
    }
    
    func perform() async throws -> some IntentResult {
        SoundManager.shared.playSound(named: note)
        
        return .result()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        do {
            let player = try AVAudioPlayer(contentsOf: url!)
            player.play()
            print("Sound is playing")
        } catch let error {
            print("error when playing sound: \(error)")
        }
    }
}
