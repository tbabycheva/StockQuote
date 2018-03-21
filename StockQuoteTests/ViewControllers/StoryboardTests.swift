//
//  StoryboardTests.swift
//  StockQuoteTests
//
//  Created by Tetiana Babycheva on 3/20/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import XCTest
@testable import StockQuote

class StoryboardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_InitialViewController_IsItemListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let navigationController =
            storyboard.instantiateInitialViewController()
                as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is StockListViewController)
    }
}
