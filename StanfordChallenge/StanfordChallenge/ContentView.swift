//
//  ContentView.swift
//  StanfordChallenge
//
//  Created by Neel Arora on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    var christmasTheme = ["🎅","🎅","❄️","❄️","☃️","☃️","🎄","🎄"]
    var halloweenTheme = ["👹","👹","😱","😱","😈","🧙","😈","🧙","☠️","☠️"]
    var waterTheme = ["🌊","🌊","🏄","🏄","🎣","🎣","🛶","🛶","🐠","🐠","🦈","🦈"]
    @State var sizeAdjuster: CGFloat = 120
    @State var theTheme = ["🎅","❄️","☃️","❄️","🎅","☃️","🎄","🎄"]
    @State var cardColor: Color = .orange
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            ScrollView{
                items.foregroundStyle(cardColor)
            }
            buttonView
        }
        .padding()
    }
    
    var buttonView: some View{
        HStack{
            christmas
            Spacer()
            halloween
            Spacer()
            water

        }
    }
    func themeButton(symbol: String, theme: [String], label: String, color: Color) -> some View{
        VStack{
            buttonTheme(symbol: symbol, theme: theme, color:color)
            Text(label)
                .font(.caption)
                .foregroundStyle(.blue)
        }
    }
    var christmas: some View{
        themeButton(symbol: "star", theme: christmasTheme, label: "Christmas", color: .orange)
    }
    var halloween: some View{
        themeButton(symbol: "lightbulb.min.badge.exclamationmark", theme: halloweenTheme, label: "Halloween", color: .red)
    
    }
    var water: some View{
        themeButton(symbol: "drop", theme: waterTheme, label: "Water", color: .blue)
    }
    var items: some View{
        // Add the .shuffled here in order to change the order
        LazyVGrid(columns:[GridItem(.adaptive(minimum: sizeAdjuster))]){
            ForEach(0..<theTheme.count, id:\.self){index in
                ThemeView(cardContent: theTheme[index])
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding()
    }
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        let width: CGFloat = (-4*CGFloat(cardCount))+190
        return width
    }
    func buttonTheme(symbol: String, theme: [String], color: Color) -> some View{
        Button(action: {
            let foo = Int.random(in: 4..<theme.count)
            
            theTheme = (theme[0..<4]+theme[4..<foo]).shuffled()
            cardColor = color
            sizeAdjuster = widthThatBestFits(cardCount: theme.count)
            
        }, label: {
            Image(systemName: symbol)
        })

    }
}
struct ThemeView: View{
    let base = RoundedRectangle(cornerRadius: 12)
    let cardContent: String
    @State var isFacingUp = true
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
