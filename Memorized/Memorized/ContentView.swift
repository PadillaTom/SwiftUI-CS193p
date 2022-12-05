//
//  ContentView.swift
//  Memorized
//
//  Created by Tomas Padilla on 04/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    // View Models:
    // Observed -> Will observer this EmojyMemoryGame for published changes
    @ObservedObject var viewModel : EmojiMemoryGame
    
    
    var body: some View {
        
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 75))
                ]) {
                    ForEach(viewModel.cards) {
                        card in CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(card.cardContent).font(.largeTitle)
            } else {
                cardShape.fill(.red)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
