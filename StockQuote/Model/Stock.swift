//
//  Stock.swift
//  StockQuote
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import Foundation

struct Stock: Equatable {
    
    private let symbolKey = "symbol"
    private let quoteKey = "latestPrice"
    
    let symbol: String
    var quote: Double?
    var high: Double?
    var low: Double?
    var volume: Int?
    
    init(symbol: String, quote: Double? = nil, high: Double? = nil, low: Double? = nil, volume: Int? = nil) {
        
        self.symbol = symbol
        self.quote = quote
        self.high = high
        self.low = low
        self.volume = volume
    }
    
    init?(stockDictionary: [String:Any]) {
        
        guard let quoteDictionary = stockDictionary["quote"] as? [String:Any],
            let symbol = quoteDictionary[symbolKey] as? String,
            let quote = quoteDictionary[quoteKey] as? Double
            else { return nil }
        
        self.symbol = symbol
        self.quote = quote
    }
}

func == (lhs: Stock, rhs: Stock) -> Bool {
    
    if lhs.symbol != rhs.symbol {
        return false
    }
    return true
}

