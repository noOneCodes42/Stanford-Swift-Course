//
//  MemorizeGameLogic.swift
//  Memorize
//
//  Created by Neel Arora on 9/7/24.
//MARK: Model
// CardContent  is a dont care which means that we do not need to specify a data type, then swift gives it some data type
// We do not really care what is the content of the card
// Private set means that looking at the variable is ok, but editing it is not allowed
import Foundation
struct MemorizeGameLogic<CardContent>{
    private(set)var cards: Array<Card>
    // We are using () and returning a type CardContent
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add numberOfPairsOfCards X 2 cards
        // If you are not using the variable change it with an underscore
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card.init(content: content))
            cards.append(Card.init(content: content))
        }
    }
    func chooseCard(_ card: Card){
        
    }
    // Embeding Card inside of a main struct is good because then you can wirte MemorizeGameLogic.card, instead of Card. It just makes more sense overall. It is good so that if you have multiple cards this makes the most sense because we can have a differnt parent class
    struct Card{
        var isFaceUp = false
        var isMathced = false
        let content: CardContent
    }
}

