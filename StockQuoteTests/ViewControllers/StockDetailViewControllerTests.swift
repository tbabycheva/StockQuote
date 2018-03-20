//
//  StockDetailViewControllerTests.swift
//  StockQuoteTests
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockDetailViewControllerTests: XCTestCase {
    
    var sut: StockDetailViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
                withIdentifier: "StockDetailViewController")
            as! StockDetailViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_HasHighLabel() {
        XCTAssertNotNil(sut.highLabel)
    }
    
    func test_HasLowLabel() {
        XCTAssertNotNil(sut.lowLabel)
    }
}
