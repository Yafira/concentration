//
//  Card.swift
//  Concentration
//
//  Created by Yafira on 9/17/19.
//  Copyright © 2019 Yafira. All rights reserved.
//

import Foundation

struct Card {
    
    internal var isFaceUp = false
    internal var isMatched = false
    internal var hasBeenFlipped = false
    internal var identifier : Int
    
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
        
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
