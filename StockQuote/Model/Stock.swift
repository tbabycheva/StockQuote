//
//  Stock.swift
//  StockQuote
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import Foundation

struct Stock {
    
    let symbol: String
    var quote: Double?
    var high: Double?
    
    init(symbol: String, quote: Double? = nil, high: Double? = nil) {
        
        self.symbol = symbol
        self.quote = quote
        self.high = high
    }
}
