//
//  SegueTests.swift
//  StockQuoteUITests
//
//  Created by Tetiana Babycheva on 3/20/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest

class SegueTests: XCTestCase {
        
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    func test_WhenTappingOnAppleStock_AppleDetailsAreLoaded() {
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["AAPL"]/*[[".cells[\"AAPL, 175.24\"].staticTexts[\"AAPL\"]",".staticTexts[\"AAPL\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let navBar = app.navigationBars.element(boundBy: 0)
        XCTAssertNotNil(navBar.staticTexts["AAPL"])

        let zeroLabel = app.staticTexts["0.00"]
        let doesntExist = NSPredicate(format: "exists == 0")

        let zeroExpectation = expectation(for: doesntExist, evaluatedWith: zeroLabel, handler: nil)
        wait(for: [zeroExpectation], timeout: 5)
    }
}
