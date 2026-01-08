//
//  SearchView.swift
//  Learn_English
//
//  Created by Anastasiia Inzer on 08.01.2026.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchTerm: String
    @Binding var isLoading: Bool
    @Binding var result: WordDefinition?
    @Binding var vocabulary: [WordDefinition]
    @Binding var isSpeaking: Bool
    @Binding var showConfetti: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // Search Bar
            HStack {
                TextField("Type any word...", text: $searchTerm)
                    .textFieldStyle(.roundedBorder)
                Button(isLoading ? "Searching..." : "Go") {
                    lookupWord()
                }
                .buttonStyle(.borderedProminent)
                .disabled(isLoading)
            }
            .padding(.horizontal)
            
            // Result or Loading
            if let result = result {
                WordCardView(
                    word: result,
                    isSpeaking: $isSpeaking,
                    vocabulary: $vocabulary,
                    showConfetti: $showConfetti
                )
            } else if isLoading {
                ProgressView("AI Processing...")
                    .scaleEffect(1.2)
            } else {
                Spacer()
                Text("Discover New Words")
                    .font(.title2)
                Text("Type any English word above")
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
    }
    
    private func lookupWord() {
        isLoading = true
        // Mock delay как в React
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            result = WordDefinition(
                word: searchTerm.lowercased(),
                translation: "переклад \(searchTerm)",
                partOfSpeech: "noun",
                definition: "AI definition for \(searchTerm)",
                example: "Example with \(searchTerm)",
                pronunciation: "pronunciation",
                addedDate: Date().description
            )
            isLoading = false
        }
    }
}
