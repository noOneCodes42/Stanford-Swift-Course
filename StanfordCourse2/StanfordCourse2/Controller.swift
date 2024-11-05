//
//  Controller.swift
//  StanfordCourse2
//
//  Created by Neel Arora on 10/28/24.
//

import Foundation
import SwiftUI
class Controller: ObservableObject{
    @Published private var model: ModelBehindTheScenes<String>
    var theme = themes1.randomElement()!
    
    init(){
        model = Controller.rerun(theme: theme)
    }
    //    static var listOfThemes: [Themes] = [Themes(name: "Christmas Theme", emojis: ["🎅","❄️","☃️","🎄","⭐️","🎁"], numberOfPairs: 6, color: .green)]
    //    static func createThemes(){
    //        listOfThemes.append(Themes(name: "Halloween Theme", emojis: ["👻","🎃","😈","🕷️","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"], numberOfPairs: 9, color: .red))
    //        listOfThemes.append(Themes(name: "Water Theme", emojis: ["🌊","🎣","🦈", "🏄", "🐬","🐋", "🛁"], numberOfPairs: 7, color: .blue))
    //
    //    }
    private static func rerun(theme: Theme)-> ModelBehindTheScenes<String>{
        let emojis = theme.emojis.shuffled()
        var cardsToBeShown = theme.numberOfPairs
        if cardsToBeShown > emojis.count{
            cardsToBeShown = emojis.count
        }
        if theme.randomized{
            let randomNumber = Int.random(in: 0...cardsToBeShown)
            cardsToBeShown = randomNumber
        }
        return ModelBehindTheScenes(numberOfCards: cardsToBeShown, cardContent: {
            pairIndex in
            if (emojis.indices.contains(pairIndex)){
                return emojis[pairIndex]
            }else{
                return "😅"
            }
            
        })
        
    }
    //    private static func createNewMemoryGame() -> ModelBehindTheScenes<String>{
    //        createThemes()
    //            return ModelBehindTheScenes(numberOfCards: listOfThemes.first?.numberOfPairs ?? 0, cardContent: {
    //                pairIndex in
    //                if let emojis = listOfThemes.first?.emojis{
    //                    if (emojis.indices.contains(pairIndex)){
    //                        return emojis[pairIndex]
    //                    }else{
    //                        return "😅"
    //                    }
    //                }else{
    //                    return "Whoops"
    //                }
    //
    //            })
    //    }
    //    @Published private var model = createNewMemoryGame()
    var cards: Array<ModelBehindTheScenes<String>.Card>{
        
        model.cards
    }
    
    func shuffle(){
        print("\(cards)1234")
        model.shuffle()
        print("h")
        objectWillChange.send()
        
    }
    func choose(_ card: ModelBehindTheScenes<String>.Card){
        model.chooseCard(card)
    }
    func getScore() -> Int{
        return model.score
    }
    
    func startGame(){
        let newTheme = themes1.randomElement()
        self.theme = newTheme!
        model = Controller.rerun(theme: theme)
        
    }
    func getColor() -> Color{
        switch theme.color{
        case "green":
            return .green
        case "red":
            return .red
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "purple":
            return .purple
        case "pink":
            return .pink
        case "cyan":
            return .cyan
        case "brown":
            return .brown
        case "gray":
                return .gray
        default:
            return .gray
        }
    }
    
}
