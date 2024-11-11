//
//  ModelBehindTheScenes.swift
//  StanfordCourse2
//
//  Created by Neel Arora on 10/28/24.
//

import Foundation

struct ModelBehindTheScenes<CardContent> where CardContent: Equatable{
    private(set)var cards: Array<Card>
    var score = 0
    var timeInterval: TimeInterval = .init()
    private let startTime = Date()
    private(set) var isGameOver: Bool = false
    init(numberOfCards: Int, cardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfCards){
            let content = cardContent(pairIndex)
            
            cards.append(Card.init(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card.init(content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
        
    }
    var indexOfTheCard: Int?
    
    
    mutating func chooseCard(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            print("start time \(startTime)")
            if !cards[chosenIndex].isFacedUp && !cards[chosenIndex].isMatched{
                cards[chosenIndex].isFacedUp = true
                
                if let potentialMatch = indexOfTheCard{
                    cards[chosenIndex].isFlipped += 1
                    cards[potentialMatch].isFlipped += 1
                    
                    /// END TIME
                    if cards[chosenIndex].content == cards[potentialMatch].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatch].isMatched = true

                        score += 200
                        // Check if all cards are matched
                        if cards.allSatisfy(\.isMatched){
                            timeInterval = Date().timeIntervalSince(startTime)
                            print("All cards matched in \(timeInterval) seconds")
                            isGameOver = true
                            score -= Int(timeInterval)
                        }
                    }else if cards[chosenIndex].isFlipped > 1 || cards[potentialMatch].isFlipped > 1{
                        score -= 100
                    }
                    indexOfTheCard = nil
                }else{
                    
                    for index in cards.indices{
                        cards[index].isFacedUp = false
                    }
                    indexOfTheCard = chosenIndex
                    
                    
                }
                cards[chosenIndex].isFacedUp = true
            }
        }
    }
    mutating func shuffle(){
        cards.shuffle()
    }
    func getTime() -> Date{
        return startTime
    }
    func getTimeTaken() -> Double{
        return timeInterval
    }
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var debugDescription: String{
            return "\(id): \(content) \(isFacedUp ? "up":"down")\(isMatched ? "matched": "not matched")"
        }
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: String
        var isFlipped: Int = 0
    }
    
}


