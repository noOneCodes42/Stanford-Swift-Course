//
//  ContentView.swift
//  Memorize
//
//  Created by Neel Arora on 8/29/24.
//MARK: The UI

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    let emojis = ["👻","🎃","😈","🕷️","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"]
    
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
        
        
        ScrollView{
            cards
        }
        .foregroundStyle(Color.orange)
        
        .padding()
    }
    var cards: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum:85))]) {
            ForEach(0..<emojis.count, id:\.self){ index in
                
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
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
