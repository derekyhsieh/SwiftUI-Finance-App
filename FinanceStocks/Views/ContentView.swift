//
//  ContentView.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 5/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var stocksVM: StocksViewModel = StocksViewModel()
    
    @State private var isShowingStockSearchSheet: Bool = false
    
    var body: some View {
        
        VStack {
            
            HeaderView(showSheet: $isShowingStockSearchSheet)
            
            PortfolioCard(stocksVM: stocksVM)
            
            WatchlistView(stocksVM: stocksVM)
            
            
            
            Spacer()
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $isShowingStockSearchSheet) {
            SearchStockView()
        }
     

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
