//
//  StockListDataProviderTests.swift
//  StockQuoteTests
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockListDataProviderTests: XCTestCase {
    
    let mockStocks: [Stock] = [
        Stock(symbol: "AAPL", quote: 178.02, high: nil, low: nil, volume: nil),
        Stock(symbol: "TSLA", quote: 321.35, high: nil, low: nil, volume: nil),
        Stock(symbol: "AMZN", quote: 1571.68, high: nil, low: nil, volume: nil)
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_NumberOfRows_IsStocksCount() {
        
        StockController.shared.stocks.append(contentsOf: mockStocks)
        
        let dataProvider = StockListDataProvider()
        let numberOfRows = dataProvider.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 3)
    }
}
