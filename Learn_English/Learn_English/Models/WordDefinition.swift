//
//  WordDefinition.swift
//  Learn_English
//
//  Created by Anastasiia Inzer on 08.01.2026.
//


import Foundation

struct WordDefinition: Identifiable {
    let id = UUID()
    let word: String
    let translation: String
    let partOfSpeech: String
    let definition: String
    let example: String
    let pronunciation: String
    let addedDate: String
}

