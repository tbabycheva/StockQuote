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
    private let highKey = "high"
    private let lowKey = "low"
    private let volumeKey = "volume"
    
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
    
    mutating func update(with dictionary: [String:Any]) {
        
        guard let high = dictionary[highKey] as? Double,
            let low = dictionary[lowKey] as? Double,
            let volume = dictionary[volumeKey] as? Int
            else { return }
        
        self.high = high
        self.low = low
        self.volume = volume
    }
}

func == (lhs: Stock, rhs: Stock) -> Bool {
    
    if lhs.symbol != rhs.symbol {
        return false
    }
    return true
}

