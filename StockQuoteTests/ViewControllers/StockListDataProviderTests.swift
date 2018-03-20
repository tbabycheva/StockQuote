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
    
    var sut: StockListViewController!
    var dataProvider = StockListDataProvider()
    
    let mockStocks: [Stock] = [
        Stock(symbol: "AAPL", quote: 178.02, high: nil, low: nil, volume: nil),
        Stock(symbol: "TSLA", quote: 321.35, high: nil, low: nil, volume: nil),
        Stock(symbol: "AMZN", quote: 1571.68, high: nil, low: nil, volume: nil)
    ]
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "StockListViewController")
        sut = viewController as! StockListViewController
        _ = sut.view
        
        StockController.shared.stocks.append(contentsOf: mockStocks)
        
    }
    
    override func tearDown() {
        StockController.shared.stocks = []
        super.tearDown()
    }
    
    func test_NumberOfRows_IsStocksCount() {
        
        let numberOfRows = sut.dataProvider.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 3)
    }
    
    func test_CellForRowAt_ReturnsExpectedCell() {
        
        let cell = sut.dataProvider.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        let stock = StockController.shared.stocks[0]
        
        XCTAssertEqual(cell.textLabel?.text, stock.symbol)
        XCTAssertEqual(cell.detailTextLabel?.text, "\(stock.quote ?? 0)")
    }
}
