//
//  EmojiMemoryGame.swift
//  Memorized
//
//  Created by Tomas Padilla on 05/12/2022.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["✈️","🚝","🚁","🚗", "🚕", "🚌", "🚚", "🚎", "🏎️", "🚓", "🛺", "🚔", "🚑", "🚒", "🚐", "🚙", "🚘", "🚍", "🚃", "🛸", "🚀", "🛳️", "⛵️", "🛶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {
                pairIndex in EmojiMemoryGame.emojis[pairIndex]
            }
    }
        
    // For our game we need to specify the "<CardContent>" type.
    // Published : we will listen to changes on this MODEL and publish a notification
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    
    // My Cards -> Array of Card (Card lives inside MemoryGame, whose CardContent type is String)
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK - Intent(s)
    func choose( _ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
}
