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
    
    func test_HasVolumeLabel() {
        XCTAssertNotNil(sut.volumeLabel)
    }
    
    func test_SettingStockDetails_SetsTextsToLabels() {
      
        let stock = Stock(symbol: "", quote: nil, high: 180.00, low: 150.00, volume: 7500)
    
        sut.stock = stock
        sut.updateViews()
        
        XCTAssertEqual(self.sut.highLabel.text, "\(stock.high ?? 0)")
        XCTAssertEqual(self.sut.lowLabel.text, "\(stock.low ?? 0)")
        XCTAssertEqual(self.sut.volumeLabel.text, "\(stock.volume ?? 0)")
    }
    
    func test_InvalidStock_ShowsZeroForDetails() {
        
        let stock = Stock(symbol: "", quote: nil, high: nil, low: nil, volume: nil)
        
        sut.stock = stock
        sut.updateViews()
        
        XCTAssertEqual(self.sut.highLabel.text, "0.0")
        XCTAssertEqual(self.sut.lowLabel.text, "0.0")
        XCTAssertEqual(self.sut.volumeLabel.text, "0")
    }
}
