//
//  WatchlistView.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 5/20/22.
//

import SwiftUI

struct WatchlistView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Watchlist")
                    .font(.title)
                    .bold()
                    .foregroundColor(.darkBlue)
                Spacer()
            }
            
            // stock cards
            ScrollView {
                VStack {
                    
                    StockCard()
                    StockCard()
                    StockCard()
                }
            }
            .padding(3)
            
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
