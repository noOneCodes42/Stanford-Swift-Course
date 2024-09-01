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
            HStack {
                ForEach(0..<cardCount, id:\.self){ index in
                    
                    CardView(content: emojis[index])
                }
            }
            .foregroundStyle(.orange)
            HStack{
                Button(action: {
                    cardCount -= 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                })
                Spacer()
                Button(action: {
                    cardCount += 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                })
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        
        .padding()
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
            if isFacedUp{
                // In order to have it display your image us Image(named: ) instead of Image(systemName: ).
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("\(content)").font(.largeTitle)
            }else{
                base.fill()
            }
        }.onTapGesture {
            // Changes the bool value
            isFacedUp.toggle()
        }
    }
}







#Preview {
    ContentView()
}
