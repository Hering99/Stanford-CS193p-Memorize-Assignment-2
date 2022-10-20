//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Lukas Hering on 06.10.22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

// List of all the Memorythemes, their name, color and the amount of cards that will be shuffled
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: ["🚲", "🚂", "🚁", "🚜", "🚕","🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"],
            numberOfPairsOfCards: 7,
            color: "red"
        ),
        Theme(
            name: "Flags",
            emojis: ["🇺🇸" ,"🇩🇪" ,"🇬🇧" ,"🇦🇺" ,"🇯🇵" ,"🇹🇭" ,"🇵🇸" ,"🇧🇷" ,"🇦🇫" ,"🇨🇳" ,"🇫🇷" ,"🇮🇷" ,"🇳🇬" ,"🇹🇷" ,"🇵🇹" ,"🇨🇷" ,"🇪🇹" ,"🇪🇪"],
            numberOfPairsOfCards: 5,
            color: "blue"
        ),
        Theme(
            name: "Animals",
            emojis: ["🐆" ,"🐗" ,"🦓" ,"🐫" ,"🦌" ,"🦥" ,"🦏" ,"🦒" ,"🐺" ,"🦘" ,"🐘" ,"🦬" ,"🐅" ,"🦛"],
            numberOfPairsOfCards: 8,
            color: "orange"
        ),
        Theme(
            name: "Plants",
            emojis: ["☘️", "🌵", "🌳", "🌿", "🌷", "🌹", "🌲", "🌴" ],
            numberOfPairsOfCards: 7,
            color: "green"
        ),
        Theme(
            name: "Weather",
            emojis: ["⛈", "🌦", "🌨", "🌧", "☀️", "🌩", "☁️", "🌤"],
            numberOfPairsOfCards: 6,
            color: "yellow"
        ),
        Theme(
            name: "Fruits",
            emojis: ["🍒", "🥝", "🍇", "🍏", "🍊", "🍌", "🫐", "🥥", "🍍", "🥭"],
            numberOfPairsOfCards: 8,
            color: "purple"
        ),
        ]

// start a new MemoryGame
    static func createMemoryGame(theme: Theme) -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return.red
        case "blue":
            return.blue
        case "orange":
            return.orange
        case "green":
            return.green
        case "yellow":
            return.yellow
        case "purple":
            return.purple
        default:
            return.black
        }
    }
    var themeName: String {
        return theme.name
    }
    var score: Int {
        return model.score
    }
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
// function for choosing a card
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
// function for starting a new Game
    func newGame(){
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
}

