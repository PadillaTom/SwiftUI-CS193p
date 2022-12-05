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
    mutating func choose(_ card: Card) {
        // Find Card inside our Array:
        let chosenIndex = index(of: card)
        let chosenCard: () = cards[chosenIndex].isFaceUp.toggle()
        
        print("Chosen card: \(chosenCard)")
        print("Current Deck State: \(cards)")
    }
    
    func index(of selectedCard: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == selectedCard.id {
                return index
            }
        }
        return 0
    }
    
    // init
    init (numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x2 to the array
        for pairIndex in 0..<numberOfPairsOfCards {
            let currentContent: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, cardContent: currentContent))
            cards.append(Card(id: pairIndex*2+1, cardContent: currentContent))
        }
    }
    
    // Structs:
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var cardContent: CardContent
    }
}
