//
//  funFacts.swift
//  funFacts
//
//  Created by Michael Piazza on 6/27/15.
//  Copyright (c) 2015 QuickSorta. All rights reserved.
//

import Foundation

class FunFacts {
    let factArray = ["rainbows are brown",
                    "life is pain",
                    "everyone is hungry",
                    "soylent contains gold"]
    var factIndex = 0
    var newIndex = 0;
    
    func getRandomFact() -> String {
        var fact: String
        while newIndex == factIndex {
            newIndex = Int(arc4random_uniform(UInt32(factArray.count)))
        }
        factIndex = newIndex
        fact = factArray[factIndex]
        return fact
    }
}
