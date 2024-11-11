//
//  ContentView.swift
//  StanfordCourse2
//
//  Created by Neel Arora on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: Controller
    var body: some View {
        VStack {
            Text("Neel Shuffle Cards")
                .font(.system(size: 36))
                .foregroundStyle(.cyan)
            if !viewModel.isGameOver(){
                Text("\(viewModel.getTimePlayed(), style: .timer)")
            }else{
                Text("Time Taken: \(Int(viewModel.getTotalTime())) seconds")
            }
            Text("Score: \(viewModel.getScore())")
            Text(" \(viewModel.theme.name)")
            
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("New Game"){
                viewModel.startGame()
            }
        }
        .foregroundStyle(viewModel.getGradient())
        .padding()
    }
    var cards: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){ card in
                VStack(spacing: 0){
                    Cards(card: card, gradient: viewModel.getGradient())
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                            
                        }
                    Text("\(card.id)")
                }
            }
        
        }
    }
}

struct Cards: View{
    let card: ModelBehindTheScenes<String>.Card
    let gradient: Gradient
    var body: some View{
        
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack{
            
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("\(card.content)")
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
            }
            .opacity(card.isFacedUp ? 1 : 0)
            base.fill().opacity(card.isFacedUp ? 0 : 1)
            
        }
        .opacity(card.isFacedUp || !card.isMatched ? 1:0)
        
    }
}
#Preview {
    ContentView(viewModel: Controller())
}
