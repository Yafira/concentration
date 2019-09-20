//
//  Concentration.swift
//  Concentration
//
//  Created by Yafira on 9/17/19.
//  Copyright © 2019 Yafira. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    var flipCount = 0
    var scoreCount = 0
    
    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
        
        internal mutating func chooseCard(at index: Int) {
            assert(cards.indices.contains(index), "Concentration.chooseCards(at: \(index)): Chosen index not valid")
            if !cards[index].isMatched {
                if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                        scoreCount += 2
                    } else {
                        penalize(card: cards[index])
                        penalize(card: cards[matchIndex])
                        cards[index].hasBeenFlipped = true
                        cards[matchIndex].hasBeenFlipped = true
                    }
            cards[index].isFaceUp = true
        } else {
//        // either 0 or 2 cards are face up
//            for flipDownIndex in cards.indices {
//                cards[flipDownIndex].isFaceUp = false
//            }
//            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        
                }
            }
        }
    
    private mutating func penalize(card: Card) {
        if(card.hasBeenFlipped) {
            scoreCount -= 1
    
    }
    
}
        init(numberOfPairsOfCards : Int) {
            assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): You must have at least one pair of cards.")
            for _ in 1...numberOfPairsOfCards {
            let card = Card()
        //            cards.append(card)
        //            cards.append(card)
            cards += [card, card]
            }
//        Shuffle the cards
            cards.shuffle()
        }

}

extension MutableCollection {
//    Shuffles the contents of this collection
    mutating func shuffle() {
        let c = count
        guard c > 1
            else {
            return
        }
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
//    Returns an array with the contents of this sequence, shuffled
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
