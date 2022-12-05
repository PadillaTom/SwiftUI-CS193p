//
//  MemoryGame.swift
//  Memorized
//
//  Created by Tomas Padilla on 05/12/2022.
//

import Foundation

struct MemoryGame<CardContent> {
    
    // Vars:
    // Protect our Cards to not be SET (modified)
    private(set) var cards: Array<Card>
    
    // Funcs:
    func choose(_ card: Card) {
        
    }
    
    // init
    init (numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x2 to the array
        for pairIndex in 0..<numberOfPairsOfCards {
            let currentContent: CardContent = createCardContent(pairIndex)
            cards.append(Card(cardContent: currentContent))
            cards.append(Card(cardContent: currentContent))
        }
    }
    
    // Structs:
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var cardContent: CardContent
    }
}
