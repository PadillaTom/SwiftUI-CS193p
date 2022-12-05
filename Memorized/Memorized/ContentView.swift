//
//  ContentView.swift
//  Memorized
//
//  Created by Tomas Padilla on 04/12/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚝","🚁","🚗", "🚕", "🚌", "🚚", "🚎", "🏎️", "🚓", "🛺", "🚔", "🚑", "🚒", "🚐", "🚙", "🚘", "🚍", "🚃", "🛸", "🚀", "🛳️", "⛵️", "🛶"]
    @State var emojiCount = 4
    var body: some View {
        VStack{
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(cardContent: emoji)
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
                cardShape.stroke(lineWidth: 3)
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
