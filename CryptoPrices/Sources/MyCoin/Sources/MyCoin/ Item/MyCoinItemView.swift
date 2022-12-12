//
//  MyCoinItemView.swift
//
//  Created by Khanh on 07/12/2022.
//

import Styleguide
import SwiftUI

struct MyCoinItemView: View {
    
    // TODO: - Remove dummy
    var percentage = 6.21

    var body: some View {
        VStack {
            VStack {
                HStack {
                    coinImage
                    coinInfo
                    Spacer()
                }

                HStack {
                    currentPrice
                    Spacer()
                    priceChangePercentage
                }
                .padding(.top, 14.0)
            }
            .padding(8.0)
        }
        .frame(width: 180.0, height: 114.0)
        .background(Color.currencyItemBackground)
        .cornerRadius(12.0)
    }
}

private extension MyCoinItemView {

    var coinImage: some View {
        // TODO: - Remove dummy
        Image("ic_bitcoin")
            .frame(width: 40.0, height: 40.0)
            .clipShape(Circle())
    }
    
    var coinInfo: some View {
        // TODO: - Remove dummy
        VStack(alignment: .leading) {
            Text("BTC")
                .foregroundColor(Color.textBold)
                .font(.Inter.bold.font(for: .callout))
                .padding(.bottom, 4.0)

            Text("Bitcoin")
                .foregroundColor(Color.textMedium)
                .font(.Inter.medium.font(for: .subheadline))
        }
    }
    
    var currentPrice: some View {
        // TODO: - Remove dummy
        Text("$24,209")
            .foregroundColor(Color.textBold)
            .font(.Inter.bold.font(for: .callout))
    }
    
    var priceChangePercentage: some View {
        // TODO: - Remove dummy
        HStack {
            Image(percentage < 0 ? "ic_arrow_down_red" : "ic_arrow_up_green")

            Text("6.21%")
                .font(.Inter.medium.font(for: .callout))
                .foregroundColor(percentage < 0 ? .carnation : .guppieGreen)
        }
    }
}

#if DEBUG
struct MyCoinItemView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinItemView()
        }
    }
}
#endif
