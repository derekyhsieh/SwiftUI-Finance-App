//
//  StockCell.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 6/10/22.
//

import SwiftUI

struct StockCell: View {
    let stock: String
    let description: String
    var body: some View {
        HStack {
            Text(stock)
                .font(.title3)
                .bold()
                .foregroundColor(Color.darkBlue)
            Spacer(minLength: 0)
            
            Text(description)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        StockCell(stock: "AAPL", description: "Apple Computers")
    }
}
