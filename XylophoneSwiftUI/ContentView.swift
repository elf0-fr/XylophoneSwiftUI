//
//  ContentView.swift
//  XylophoneSwiftUI
//
//  Created by Elfo on 25/06/2025.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    let spacing: CGFloat = 8
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: spacing) {
                Group(subviews: musicalNotes) { subviews in
                    ForEach(subviews.indices, id: \.self) { index in
                        subviews[index]
                            .padding(.horizontal, getPadding(forIndex: index))
                    }
                    .frame(
                        height: getHeight(
                            withSubviewsCount: subviews.count,
                            geometry: geometry
                        )
                    )
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    var musicalNotes: some View {
        MusicalNote(note: "C", color: .red)
        MusicalNote(note: "D", color: .orange)
        MusicalNote(note: "E", color: .yellow)
        MusicalNote(note: "F", color: .green)
        MusicalNote(note: "G", color: .indigo)
        MusicalNote(note: "A", color: .blue)
        MusicalNote(note: "B", color: .purple)
    }
    
    func getHeight(withSubviewsCount count: Int, geometry: GeometryProxy) -> CGFloat {
        let availableSpace = geometry.size.height - spacing * CGFloat(count - 1)
        
        return availableSpace / CGFloat(count)
    }
    
    func getPadding(forIndex index: Int) -> CGFloat {
        return CGFloat(index * 8)
    }
}

#Preview {
    ContentView()
}

struct MusicalNote: View {
    
    let note: String
    let color: Color
    
    @State private var player: AVAudioPlayer!
    
    var body: some View {
        Button {
            playSound()
        } label: {
            Rectangle().fill(color)
                .overlay{
                    Text(note)
                        .font(.system(size: 42))
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(.white)
                        .padding(8)
                }
        }
        .buttonStyle(.plain)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch let error {
            print("error when playing sound: \(error)")
        }
    }
}
