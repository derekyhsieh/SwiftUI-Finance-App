//
//  StockCard.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 5/20/22.
//

import SwiftUI

struct StockCard: View {
    let stockModel: StockModel
    @State private var logoStr: String = ""
    
    var body: some View {
        VStack {
            HStack {
                
                AsyncImage(url: URL(string: "https://logo.clearbit.com/\(logoStr).com")) { image in
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(10)


                
                
                
                VStack {
                    Text(stockModel.symbol)
                        .bold()
                        .font(.title3)
                    Text(stockModel.description ?? "")
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                
                Spacer()
                
                Text(
                    
                    (((stockModel.percentageChange ?? 0.0) >= 0.0) ? "+" : "")
                    
                    +
                    
                    "\(String(format: "%.2f" ,stockModel.percentageChange ?? 0.0))%"
                
                )
                    .foregroundColor((stockModel.percentageChange ?? 0.0) >= 0.0 ? Color.lightGreen : Color.red)
                    .bold()
                    .font(.title3)
            }
            
            Spacer()
            HStack {
                Text("$\(String(format: "%.2f",stockModel.currentPrice ?? 0.0))")
                    .bold()
                    .font(.title)
                
                Spacer()
                LineChart(data: stockModel.candles.normalizedValues)
                    .stroke((stockModel.percentageChange ?? 0.0) >= 0.0 ? Color.lightGreen : Color.red, lineWidth: 1.5)
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
        .onAppear {
            if let logoStr = stockModel.description?.components(separatedBy: " ").first {
                // get first word
                self.logoStr = logoStr.lowercased()
            }
        }
    }
}

//struct StockCard_Previews: PreviewProvider {
//    static var previews: some View {
//        StockCard()
//    }
//}
