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
    
    func test_Init_WhenPassedQuote_SetsQuote() {
        let stock = Stock(symbol: "", quote: 178.65)
        XCTAssertEqual(stock.quote, 178.65, "should set stock quote")
    }
    
    func test_Init_WhenPassedStockHigh_SetsHigh() {
        let stock = Stock(symbol: "", high: 180.00)
        XCTAssertEqual(stock.high, 180.00, "should set stock high")
    }
    
    func test_Init_WhenPassedStockLow_SetsLow() {
        let stock = Stock(symbol: "", low: 150.00)
        XCTAssertEqual(stock.low, 150.00, "should set stock low")
    }
    
    func test_Init_WhenPassedStockVolume_SetsVolume() {
        
        let stock = Stock(symbol: "", volume: 7500)
        XCTAssertEqual(stock.volume, 7500, "should set stock volume")
    }
    
    func test_AllPropertiesAreSetCorrectly_ForAValidDictionary() {
        let validDictionary: [String:Any] = ["quote":["symbol":"AAPL","latestPrice":175.24]]
        let sut = Stock(stockDictionary: validDictionary)
        XCTAssertEqual(sut?.symbol, "AAPL")
        XCTAssertEqual(sut?.quote, 175.24)
    }
}
