//
//  EmojiMemoryGame.swift
//  Memorized
//
//  Created by Tomas Padilla on 05/12/2022.
//

import SwiftUI



class EmojiMemoryGame {
    
    static let emojis = ["✈️","🚝","🚁","🚗", "🚕", "🚌", "🚚", "🚎", "🏎️", "🚓", "🛺", "🚔", "🚑", "🚒", "🚐", "🚙", "🚘", "🚍", "🚃", "🛸", "🚀", "🛳️", "⛵️", "🛶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {
                pairIndex in EmojiMemoryGame.emojis[pairIndex]
            }
    }
    // For our game we need to specify the "<CardContent>" type.
    // Private(set) -> private to set, but can read.
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    
    // My Cards -> Array of Card (Card lives inside MemoryGame, whose CardContent type is String)
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
