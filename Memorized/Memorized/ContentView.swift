//
//  ContentView.swift
//  Memorized
//
//  Created by Tomas Padilla on 04/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            
            Text("✈️")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
