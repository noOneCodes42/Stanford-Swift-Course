//
//  ContentView.swift
//  StanfordChallenge
//
//  Created by Neel Arora on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    var christmasTheme = ["🎅","❄️","☃️","❄️","🎅","☃️","🎄","🎄"]
    var halloweenTheme = ["😱","👹","😈","🧙","👹","😈","😱","🧙","☠️","☠️"]
    var waterTheme = ["🌊","🌊","🏄","🏄","🎣","🎣","🛶","🛶","🐠","🐠","🦈","🦈"]
    @State var theTheme = [""]

    @State var cards = 4
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                if theTheme == christmasTheme{
                    items
                        .foregroundStyle(.green)
                }else if theTheme == waterTheme{
                    items
                        .foregroundStyle(.blue)
                }else if theTheme == halloweenTheme{
                    items
                        .foregroundStyle(.red)
                }else{
                    VStack{
                        Text("Choose one of the icons to begin")
                    }
                    items
                        .foregroundStyle(.opacity(0))
                }
                

            }
            buttonView
        }
        .padding()
    }
    var buttonView: some View{
        HStack{
            VStack{
                buttonTheme(symbol: "star", theme: christmasTheme)
                Text("Christmas")
                    .font(.caption)
                    .foregroundStyle(.blue)
            }
            Spacer()
            VStack{
                buttonTheme(symbol: "lightbulb.min.badge.exclamationmark", theme: halloweenTheme)
                Text("Halloween")
                    .font(.caption)
                    .foregroundStyle(.blue)
            }
            Spacer()
            VStack{
                buttonTheme(symbol: "drop", theme: waterTheme)
                Text("Water")
                    .font(.caption)
                    .foregroundStyle(.blue)
            }
        }
    }
    
    var items: some View{
        // Add the .shuffled here in order to change the order
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<theTheme.count, id:\.self){index in
                ThemeView(cardContent: theTheme.shuffled()[index])
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding()
    }
   
    func buttonTheme(symbol: String, theme: [String]) -> some View{
        Button(action: {
            theTheme = theme
        }, label: {
            Image(systemName: symbol)
        })

    }
}
struct ThemeView: View{
    let base = RoundedRectangle(cornerRadius: 12)
    let cardContent: String
    @State var isFacingUp = false
    var body: some View{
        ZStack{
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text("\(cardContent)").font(.largeTitle)
            }
            .opacity(isFacingUp ? 1:0)
            base.fill().opacity(isFacingUp ? 0:1)
        }.onTapGesture {
            isFacingUp.toggle()
        }
    }
        
}


#Preview {
    ContentView()
}
