//
//  EmojiGameView.swift
//  Memorize
//
//  Created by Neel Arora on 8/29/24.
//MARK: The UI

import SwiftUI

struct EmojiGameView: View {
    // Difference between ObservedObject VS. State
    // State is tied to the lifetime of the view
    // ObsevedObject just changes when something changes, the lifetime depends on something
    // State can only be used in one view
    // Observed can be used anywhere
    @ObservedObject var viewModel: EmojiMemoryGame
    
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
        
        VStack{
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .foregroundStyle(Color.orange)
        
        .padding()
    }
    var cards: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards){ card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
}
// No math or backend or anything not relating to UI
// When self is immutable, use @State, or use game logic
struct CardView: View {
    let card: MemorizeGameLogic<String>.Card
    
    var body: some View {
        let base =  RoundedRectangle(cornerRadius: 12)
        ZStack{
            // Group can hold stuff but is inside of a z stack
            Group{
                // In order to have it display your image us Image(named: ) instead of Image(systemName: ).
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("\(card.content)")
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            // It is the opposite when using Group
            .opacity(card.isFacedUp ? 1 : 0)
            // If it is faced up then it is transparent else it is not transparents
            base.fill().opacity(card.isFacedUp ? 0 : 1)
            
        }
        .opacity(card.isFacedUp || !card.isMathced ? 1:0)
    }
}






// We are creating a new view model
// It is getting exucted everytime something changes
#Preview {
    EmojiGameView(viewModel: EmojiMemoryGame())
}
