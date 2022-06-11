//
//  StockCard.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 5/20/22.
//

import SwiftUI

struct StockCard: View {
    var body: some View {
        VStack {
            HStack {
//                        AsyncImage(url: URL(string: "https://logo.clearbit.com/apple.com"))
                
                Image(systemName: "appletv.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
                    .font(.system(size: 50))
//                            .frame(width: 50, height: 50)
                
                
                VStack {
                    Text("AAPL")
                        .bold()
                        .font(.title3)
                    Text("Apple Inc")
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                
                Spacer()
                
                Text("1.2%")
                    .foregroundColor(.lightGreen)
                    .bold()
                    .font(.title3)
            }
            
            Spacer()
            HStack {
                Text("$137.59")
                    .bold()
                    .font(.title)
                
                Spacer()
                LineChart(data: StockMockData.apple.normalizedValues)
                    .stroke(Color.lightGreen, lineWidth: 1.5)
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .padding(5)
        .frame(height: UIScreen.main.bounds.height / 4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray)
        )
    }
}

struct StockCard_Previews: PreviewProvider {
    static var previews: some View {
        StockCard()
    }
}
