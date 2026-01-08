//
//  WordCardView.swift
//  Learn_English
//
//  Created by Anastasiia Inzer on 08.01.2026.
//

import SwiftUI

struct WordCardView: View {
    let word: WordDefinition
    @Binding var isSpeaking: Bool
    @Binding var vocabulary: [WordDefinition]
    @Binding var showConfetti: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(word.word)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button(action: { speakWord() }) {
                    Image(systemName: isSpeaking ? "speaker.wave.2.fill" : "speaker.wave.1")
                }
                .buttonStyle(.borderless)
            }
            
            Text(word.translation)
                .font(.headline)
            Text(word.definition)
            Text("Example: \(word.example)")
                .italic()
            
            Button("Add to Vocabulary") {
                vocabulary.append(word)
                showConfetti = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 5)
    }
    
    private func speakWord() {
        // TTS позже
        isSpeaking.toggle()
    }
}
