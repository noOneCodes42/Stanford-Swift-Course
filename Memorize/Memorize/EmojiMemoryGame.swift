//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Neel Arora on 9/7/24.
//
// Negotiating with your ui and your model
// MARK: View Model
import SwiftUI

class EmojiMemoryGame{
    // The <> is giving the don't care value a value
    // external names are not allowed in closures
    // $0 is the first argument
    // static makes it a gloabl variable but only this class can use it, which make it look nice, and it is init first
    private static let emojis = ["👻","🎃","😈","🕷️","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"]
    // Return types always have to be explicit
    private static func createMemoryGame() -> MemorizeGameLogic<String>{
        return MemorizeGameLogic(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
            
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemorizeGameLogic<String>.Card>{
        return model.cards
    }
    func choose(_ card: MemorizeGameLogic<String>.Card){
        model.chooseCard(card)
    }
}
