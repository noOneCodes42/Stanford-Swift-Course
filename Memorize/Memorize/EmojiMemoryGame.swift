//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Neel Arora on 9/7/24.
//
// Negotiating with your ui and your model
// MARK: View Model
import SwiftUI

class EmojiMemoryGame: ObservableObject{
    // The <> is giving the don't care value a value
    // external names are not allowed in closures
    // $0 is the first argument
    // static makes it a gloabl variable but only this class can use it, which make it look nice, and it is intialized first
    static let emojis = ["👻","🎃","😈","🕷️","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"]
    // Return types always have to be explicit
    private static func createMemoryGame() -> MemorizeGameLogic<String>{
        return MemorizeGameLogic(numberOfPairsOfCards:  12) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else{
                return "😅"
            }
        }
    }
    // Observe if something is changed
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemorizeGameLogic<String>.Card>{
        return model.cards
    }
    //MARK: - Intents
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    func choose(_ card: MemorizeGameLogic<String>.Card){
        model.chooseCard(card)
    }
}
