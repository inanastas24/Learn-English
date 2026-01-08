//
//  VocabularyView.swift
//  Learn_English
//
//  Created by Anastasiia Inzer on 08.01.2026.
//

import SwiftUI

struct VocabularyView: View {
    @Binding var vocabulary: [WordDefinition]
    @Binding var isSpeaking: Bool
    
    var body: some View {
        NavigationView {
            List(vocabulary) { word in
                VStack(alignment: .leading) {
                    Text(word.word).font(.headline)
                    Text(word.translation).foregroundColor(.secondary)
                }
            }
            .navigationTitle("Vocabulary (\(vocabulary.count))")
        }
    }
}
