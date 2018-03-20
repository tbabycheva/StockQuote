//
//  StockListDataProvider.swift
//  StockQuote
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import UIKit

class StockListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return StockController.shared.stocks.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        
        let stock = StockController.shared.stocks[indexPath.row]
        
        cell.textLabel?.text = stock.symbol
        cell.detailTextLabel?.text = "\(stock.quote ?? 0)"
        
        return cell
    }
}
