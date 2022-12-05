//
//  ContentView.swift
//  Memorized
//
//  Created by Tomas Padilla on 04/12/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚝","🚁","🚗", "🚕", "🚌", "🚚", "🚎", "🏎️", "🚓", "🛺", "🚔", "🚑", "🚒", "🚐", "🚙", "🚘", "🚍", "🚃", "🛸", "🚀", "🛳️", "⛵️", "🛶"]
    @State var emojiCount = 24
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 75))
                ]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(cardContent: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeBtn
                Spacer()
                addBtn
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var removeBtn: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
           Image(systemName: "minus.circle")
        })
    }
    
    var addBtn: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView: View {
    var cardContent: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(cardContent).font(.largeTitle)
            } else {
                cardShape.fill(.red)
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
