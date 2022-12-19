//
//  StocksViewModel.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 12/18/22.
//

import Foundation
import SwiftUI


class StocksViewModel: ObservableObject {
    
    var tickers = ["AAPL", "NVDA", "NFLX"]
    
    @Published var stocks: [StockModel] = [StockModel]()
    
    
    init() {
        self.fetchStockData()
    }
    
    
    public func fetchStockData() {
        
        for ticker in tickers {
            
            APIRequest.instance.getSymbolLookup(searchQuery: ticker) { returnedLookup in
                APIRequest.instance.getSymbolQuote(symbol: ticker) { returnedQuote in
                    APIRequest.instance.getCandles(symbol: ticker, hourLength: 12) { returnedCandles in
                        
                        let candleArray: [CGFloat] = returnedCandles?.c.map {CGFloat($0)} ?? []
                        
                        let stockInfo = returnedLookup?.result[0]
                        
                        let newStock = StockModel(symbol: ticker, description: stockInfo?.description, currentPrice: returnedQuote?.c, percentageChange: returnedQuote?.dp, candles: candleArray)
                        
                        
                        DispatchQueue.main.async {
                            self.stocks.append(newStock)
                        }
                        
                        
                    }
                }
            }
            
            
        }
        
    }
    
}
