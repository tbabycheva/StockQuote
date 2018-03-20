//
//  StockListViewControllerTests.swift
//  StockQuoteTests
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockListViewControllerTests: XCTestCase {
    
    var sut: StockListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "StockListViewController")
        sut = viewController as! StockListViewController
        
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_TableView_AfteViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
}