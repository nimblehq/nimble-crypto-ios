//
//  TrendingCoinItemView.swift
//
//  Created by Mike Pham on 15/12/2022.
//

import Styleguide
import SwiftUI

struct TrendingCoinItemView: View {

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

    private let coinItem: TrendingCoinItem

    init(_ coinItem: TrendingCoinItem) {
        self.coinItem = coinItem
    }
}

private extension TrendingCoinItemView {

    var coinImage: some View {
        AsyncImage(
            url: coinItem.iconUrl,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            },
            placeholder: {
                // TODO: Update with proper placeholder or apply skeleton.
                EmptyView()
            }
        )
        .frame(width: 40.0, height: 40.0)
    }

    var coinInfo: some View {
        VStack(alignment: .leading) {
            Text(coinItem.symbol)
                .foregroundColor(Colors.textBold.swiftUIColor)
                .font(Fonts.Inter.semiBold.textStyle(.body))
                .padding(.bottom, 4.0)

            Text(coinItem.name)
                .foregroundColor(Colors.textMedium.swiftUIColor)
                .font(Fonts.Inter.medium.textStyle(.callout))
        }
    }

    var priceChangePercentage: some View {
        HStack {
            coinItem.isPriceUp
            ? Images.icArrowUpGreen.swiftUIImage
            : Images.icArrowDownRed.swiftUIImage

            Text(coinItem.priceChangePercentage, format: .percentage)
                .font(Fonts.Inter.medium.textStyle(.body))
                .foregroundColor(
                    coinItem.isPriceUp
                    ? Colors.guppieGreen.swiftUIColor
                    : Colors.carnation.swiftUIColor
                )
        }
    }
}

#if DEBUG
struct TrendingCoinItemView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            TrendingCoinItemView(.mock)
        }
    }
}
#endif
