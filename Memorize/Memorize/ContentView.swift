//
//  ContentView.swift
//  Memorize
//
//  Created by Neel Arora on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","😈","🕷️","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"]
    @State var cardCount: Int = 4
    // some view, means that it has to behave like a view, and it will set the view to whatever the program returns
    // The view is built out of other views.
    // Everything we have so far is a view and we aare combining all the view with the var body
    // It packages all the views so far into a tupil view, a list of views
    // a view builder converts view into tupil view
    var body: some View {
        // Vstack is an embeded function
        // VStack vertical
        // ZStack on top of each other
        // HStack horizontal
        
        VStack {
            ScrollView{
                cards
            }
                .foregroundStyle(.orange)
            Spacer()

            cardCountAdjusters
        }
        
        .padding()
    }
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    var cards: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum:120))]) {
            ForEach(0..<cardCount, id:\.self){ index in
                
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View{
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardAdder: some View{
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}
// No math or backend or anything not relating to ui
// When self is immutable, use @State, or use game logiv
struct CardView: View {
    let content: String
    @State var isFacedUp = true
    
    var body: some View {
        let base =  RoundedRectangle(cornerRadius: 12)
        ZStack{
            // Group can hold stuff but is inside of a z stack
            Group{
                // In order to have it display your image us Image(named: ) instead of Image(systemName: ).
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("\(content)").font(.largeTitle)
            }
            // It is the opposite when using Group
                .opacity(isFacedUp ? 1 : 0)
            // If it is faced up then it is transparent else it is not transparent
            base.fill().opacity(isFacedUp ? 0 : 1)

        }.onTapGesture {
            // Changes the bool value
            isFacedUp.toggle()
        }
    }
}







#Preview {
    ContentView()
}
