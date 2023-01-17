//
//  CurrentPriceSection.swift
//  MyCoin
//
//  Created by Minh Pham on 22/12/2022.
//

import Styleguide
import SwiftUI

struct CurrentPriceSection: View {

    var body: some View {
        VStack(spacing: 8.0) {
            AsyncImage(
                url: coinItem.imageURL,
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    EmptyView()
                }
            )
            .frame(width: 60.0, height: 60.0)

            VStack(spacing: 4.0) {
                Text(coinItem.currentPrice, format: .dollarCurrency)
                    .foregroundColor(Colors.textBold.swiftUIColor)
                    .font(Fonts.Inter.semiBold.textStyle(.title))
                    .frame(height: 34.0)

                Button(action: {}, label: {
                    HStack {
                        PercentageView(coinItem.priceChangePercentage24H)
                            .font(Fonts.Inter.medium.textStyle(.callout))
                    }
                })
                .padding(EdgeInsets(top: 8.0, leading: 10.0, bottom: 8.0, trailing: 10.0))
                .foregroundColor(Colors.guppieGreen.swiftUIColor)
                .background(Colors.scandal.swiftUIColor)
                .cornerRadius(20.0)
            }
        }
        .padding(.vertical, 8.0)
        .frame(maxWidth: .infinity)
    }

    private let coinItem: CoinDetailItem

    init(_ coinItem: CoinDetailItem) {
        self.coinItem = coinItem
    }
}

#if DEBUG
struct CurrentPriceSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            CurrentPriceSection(.mock)
        }
    }
}
#endif
