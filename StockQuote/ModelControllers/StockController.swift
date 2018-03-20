//
//  StockController.swift
//  StockQuote
//
//  Created by Tetiana Babycheva on 3/19/18.
//  Copyright © 2018 babycheva. All rights reserved.
//

import Foundation

class StockController {
    
    var stocks: [Stock] = []
    
    static let shared = StockController()
    
    func fetchStockBatch(completion: @escaping () -> Void) {
        
        let baseURL = URL(string: "https://api.iextrading.com/1.0/stock/market/batch?symbols=nke,tsla,amzn,aapl,goog&types=quote&filter=symbol,latestPrice")
        
        guard let url = baseURL else { completion(); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error)  in
            
            if let error = error {
                print("\(error.localizedDescription)")
                completion()
                return }
            
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] else { completion(); return }
            
            let arrayOfStockDictionaries = jsonDictionary.flatMap { $0.value as? [String:Any]}
            
            let stocks = arrayOfStockDictionaries.flatMap( {Stock(stockDictionary: $0) })
            
            self.stocks = stocks
            
            completion()
            
        }
        dataTask.resume()
    }
    
    func fetchStockDetails(for stock: Stock, completion: @escaping (Stock?) -> Void) {
        
        var localStock = stock
        
        let baseURL = URL(string: "https://api.iextrading.com/1.0/stock")
        
        let stockURL = baseURL?.appendingPathComponent(localStock.symbol.lowercased()).appendingPathComponent("chart").appendingPathComponent("1d")
        guard let url = stockURL else { completion(nil); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error)  in
            
            if let error = error {
                print("\(error.localizedDescription)")
                completion(nil)
                return }
            
            guard let data = data,
                let arrayOfStockDictionaries = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [[String : Any]],
                let details = arrayOfStockDictionaries.last
                else { completion(nil); return }
            
            localStock.update(with: details)
            
            completion(localStock)
        }
        dataTask.resume()
    }
}
