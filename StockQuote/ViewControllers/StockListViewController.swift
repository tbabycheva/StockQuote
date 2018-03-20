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
    @IBOutlet var dataProvider: UITableViewDataSource!
    
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
    }
}
