//
//  StockControllerTests.swift
//  StockQuoteTests
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockControllerTests: XCTestCase {
    
    let expectedStocks = [
        Stock(symbol: "NKE", quote: 65.71, high: nil, low: nil, volume: nil),
        Stock(symbol: "TSLA", quote: 313.56, high: nil, low: nil, volume: nil),
        Stock(symbol: "AMZN", quote: 1544.93, high: nil, low: nil, volume: nil),
        Stock(symbol: "AAPL", quote: 175.30, high: nil, low: nil, volume: nil),
        Stock(symbol: "GOOG", quote: 1099.82, high: nil, low: nil, volume: nil)
        ].sorted(by:{ $0.symbol < $1.symbol })
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_API_FetchesBatchOfStocks() {
        
        let expectation = XCTestExpectation()
        
        StockController.shared.fetchStockBatch() {
            
            let actualStocks = StockController.shared.stocks.sorted(by: { $0.symbol < $1.symbol })
            
            XCTAssertEqual(self.expectedStocks, actualStocks)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
}
