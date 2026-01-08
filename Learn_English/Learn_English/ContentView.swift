//
//  ContentView.swift
//  Learn_English
//
//  Created by Anastasiia Inzer on 08.01.2026.
//

import SwiftUI

struct ContentView: View {
    // Основные состояния поиска
    @State private var searchTerm: String = ""
    @State private var isLoading: Bool = false
    @State private var result: WordDefinition? = nil
    
    // Словарь и управление
    @State private var vocabulary: [WordDefinition] = []
    @State private var isSpeaking: Bool = false
    
    // Навигация и UI
    @State private var activeView: ActiveView = .search
    @State private var menuOpen: Bool = false
    @State private var showConfetti: Bool = false
    
    var body: some View {
        TabView(selection: $activeView) {
            SearchView(
                searchTerm: $searchTerm,
                isLoading: $isLoading,
                result: $result,
                vocabulary: $vocabulary,
                isSpeaking: $isSpeaking,
                showConfetti: $showConfetti
            )
            .tabItem { Label("Search", systemImage: "magnifyingglass") }
            .tag(ActiveView.search)
            
            VocabularyView(
                vocabulary: $vocabulary,
                isSpeaking: $isSpeaking
            )
            .tabItem { Label("Vocabulary", systemImage: "bookmark") }
            .tag(ActiveView.vocabulary)
        }
    }
}

enum ActiveView {
    case search, vocabulary
}

#Preview {
    ContentView()
}
