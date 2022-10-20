//
//  Theme.swift
//  Memorize
//
//  Created by Lukas Hering on 15.10.22.
//

import Foundation

// sets all the variables that appear on the Cards
struct Theme {
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    var color: String
    
    init(name: String, emojis: Array<String>, numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
        self.color = color
    }
}
