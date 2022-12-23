//
//  TrendingCoinItemView.swift
//
//  Created by Mike Pham on 15/12/2022.
//

import Styleguide
import SwiftUI

struct TrendingCoinItemView: View {

    // TODO: - Remove dummy
    var percentage = 6.21

    var body: some View {
        HStack {
            HStack {
                coinImage
                coinInfo
                Spacer()
                priceChangePercentage
            }
            .padding(8.0)
        }
        .frame(height: 68.0)
        .background(Colors.bgCurrencyItem.swiftUIColor)
        .cornerRadius(12.0)
    }
}

private extension TrendingCoinItemView {

    var coinImage: some View {
        // TODO: - Remove dummy
        Images.icBitcoin.swiftUIImage
            .frame(width: 40.0, height: 40.0)
            .clipShape(Circle())
    }

    var coinInfo: some View {
        // TODO: - Remove dummy
        VStack(alignment: .leading) {
            Text("BTC")
                .foregroundColor(Colors.textBold.swiftUIColor)
                .font(Fonts.Inter.semiBold.textStyle(.body))
                .padding(.bottom, 4.0)

            Text("Bitcoin")
                .foregroundColor(Colors.textMedium.swiftUIColor)
                .font(Fonts.Inter.medium.textStyle(.callout))
        }
    }

    var priceChangePercentage: some View {
        // TODO: - Remove dummy
        HStack {
            percentage < 0.0
            ? Images.icArrowDownRed.swiftUIImage
            : Images.icArrowUpGreen.swiftUIImage

            Text(percentage, format: .percentage)
                .font(Fonts.Inter.medium.textStyle(.body))
                .foregroundColor(
                    percentage < 0.0
                    ? Colors.carnation.swiftUIColor
                    : Colors.guppieGreen.swiftUIColor
                )
        }
    }
}

#if DEBUG
struct TrendingCoinItemView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            TrendingCoinItemView()
        }
    }
}
#endif
