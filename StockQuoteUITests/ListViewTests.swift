//
//  ListViewTests.swift
//  StockQuoteUITests
//
//  Created by Tetiana Babycheva on 3/20/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest

class ListViewTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    func test_WhenTableViewLoaded_AllExpectedStocksAreLoaded() {
        let appleLabel = app.staticTexts["AAPL"]
        let amazonLabel = app.staticTexts["AMZN"]
        let googleLabel = app.staticTexts["GOOG"]
        let nikeLabel = app.staticTexts["NKE"]
        let teslaLabel = app.staticTexts["TSLA"]
        
        let exists = NSPredicate(format: "exists == 1")
        
        var expectations = [XCTestExpectation]()
        
        for label in [appleLabel, amazonLabel, googleLabel, nikeLabel, teslaLabel] {
            let labelExpectation = expectation(for: exists, evaluatedWith: label, handler: nil)
            expectations.append(labelExpectation)
        }
        
        wait(for: expectations, timeout: 5)
    }
}
