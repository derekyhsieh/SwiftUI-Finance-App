//
//  PortfolioCard.swift
//  FinanceStocks
//
//  Created by Derek Hsieh on 5/20/22.
//

import SwiftUI

struct PortfolioCard: View {
    
    @StateObject var stocksVM: StocksViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Portfolio Value")
                .foregroundColor(Color.gray)
                .font(.title2)
            
            HStack(alignment: .top) {
                Text("\(String(format: "%.2f", stocksVM.stocks.map({$0.currentPrice ?? 0.0}).reduce(0.0, +)))")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                Text("2.1%")
                    .foregroundColor(Color.lightGreen)
                    .bold()
                    .font(.title3)
            }
            
            Spacer()
            
            HStack{
                Button(action: {
                    
                }) {
                    Text("Deposit")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.lightGreen)
                        )
                    
                }
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Withdraw")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                    
                }

            }
            
        }
        .padding()
        .frame(height: UIScreen.main.bounds.height / 4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.darkBlue)
        )
        
    }
}

//struct PortfolioCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PortfolioCard()
//            .padding()
//    }
//}
