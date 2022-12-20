//
//  MyCoinItemView.swift
//
//  Created by Khanh on 07/12/2022.
//

import Styleguide
import SwiftUI

struct MyCoinItemView: View {

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
        .frame(width: 240.0)
        .background(Colors.bgCurrencyItem.swiftUIColor)
        .cornerRadius(12.0)
    }

    private let coinItem: MyCoinItem

    init(_ coinItem: MyCoinItem) {
        self.coinItem = coinItem
    }
}

private extension MyCoinItemView {

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
                .font(Fonts.Inter.bold.textStyle(.callout))
                .foregroundColor(Colors.textBold.swiftUIColor)
                .padding(.bottom, 4.0)

            Text(coinItem.name)
                .font(Fonts.Inter.medium.textStyle(.subheadline))
                .foregroundColor(Colors.textMedium.swiftUIColor)
        }
    }
    
    var currentPrice: some View {
        Text(coinItem.currentPrice, format: .dollarCurrency)
            .font(Fonts.Inter.bold.textStyle(.callout))
            .foregroundColor(Colors.textBold.swiftUIColor)
    }
    
    var priceChangePercentage: some View {
        HStack {
            coinItem.isPriceUp
            ? Images.icArrowUpGreen.swiftUIImage
            : Images.icArrowDownRed.swiftUIImage

            Text(coinItem.priceChangePercentage, format: .percentage)
                .font(Fonts.Inter.bold.textStyle(.callout))
                .foregroundColor(
                    coinItem.isPriceUp
                    ? Colors.guppieGreen.swiftUIColor
                    : Colors.carnation.swiftUIColor
                )
        }
    }
}

#if DEBUG
struct MyCoinItemView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinItemView(.mock)
        }
    }
}
#endif
