//
//  StockListViewController.swift
//  StockQuote
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import UIKit

class StockListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: StockListDataProvider!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        dataProvider.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataProvider.fetchData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let stock = StockController.shared.stocks[indexPath.row]
            
            let detailVC = segue.destination as? StockDetailViewController
            
            detailVC?.title = stock.symbol
            detailVC?.stock = stock
        }
    }
}
