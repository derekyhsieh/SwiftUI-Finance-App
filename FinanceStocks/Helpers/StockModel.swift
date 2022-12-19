//
//  StockModel.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 12/18/22.
//

import Foundation

struct StockModel: Hashable {
    let symbol: String // AAPL
    let description: String? // Apple Inc
    let currentPrice: Double? // 150.20
    let percentageChange: Double?
    let candles: [CGFloat]
}
