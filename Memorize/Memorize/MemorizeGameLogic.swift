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
struct MemorizeGameLogic<CardContent> where CardContent: Equatable{
    private(set)var cards: Array<Card>
    // We are using () and returning a type CardContent
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add numberOfPairsOfCards X 2 cards
        // If you are not using the variable change it with an underscore
        // makes makes it so so that there is a minimum of 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card.init(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card.init(content: content, id: "\(pairIndex+1)b"))
        }
    }
    var IndexOfTheOneAndOnlyFacedUpCard: Int?
    mutating func chooseCard(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFacedUp && !cards[chosenIndex].isMathced{
                cards[chosenIndex].isFacedUp = true
                if let potentialMatchIndex = IndexOfTheOneAndOnlyFacedUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMathced = true
                        cards[potentialMatchIndex].isMathced = true
                    }
                    IndexOfTheOneAndOnlyFacedUpCard =  nil
                }else{
                    for index in cards.indices{
                        cards[index].isFacedUp = false
                    }
                    IndexOfTheOneAndOnlyFacedUpCard = chosenIndex
                }
                cards[chosenIndex].isFacedUp = true
            }

        }
    }
    mutating func shuffle(){
        cards.shuffle()
    }
    // Embeding Card inside of a main struct is good because then you can wirte MemorizeGameLogic.card, instead of Card. It just makes more sense overall. It is good so that if you have multiple cards this makes the most sense because we can have a differnt parent class
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var debugDescription: String{
            return "\(id): \(content) \(isFacedUp ? "up": "down")\(isMathced ? "matched": "")"
        }
        
        var isFacedUp = false
        var isMathced = false
        let content: CardContent
        var id: String
    }
}

