//
//  StockTests.swift
//  StockQuoteTests
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_Init_WhenPassedSymbol_SetsSymbol() {
        let stock = Stock(symbol: "AAPL")
        XCTAssertEqual(stock.symbol, "AAPL", "should set stock symbol")
    }
}
