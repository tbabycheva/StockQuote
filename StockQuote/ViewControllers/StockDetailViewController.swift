//
//  StockDetailViewController.swift
//  StockQuote
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    
    @IBOutlet var highLabel: UILabel!
    @IBOutlet var lowLabel: UILabel!
    @IBOutlet var volumeLabel: UILabel!
    
    var stock: Stock? {
        didSet {
            updateViews()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchStockDetails()
    }
    
    func fetchStockDetails() {
        
        guard let stock = stock else { return }
        
        StockController.shared.fetchStockDetails(for: stock) { (fetchedStock) in
            
            DispatchQueue.main.async {
            self.stock = fetchedStock
            }
        }
    }
    
    func updateViews() {
        
        guard isViewLoaded,
            let stock = stock else { return }
        
        self.highLabel.text = "\(stock.high ?? 0)"
        self.lowLabel.text = "\(stock.low ?? 0)"
        self.volumeLabel.text = "\(stock.volume ?? 0)"
    }
}
