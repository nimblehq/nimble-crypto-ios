//
//  CoinStatisticsSection.swift
//  MyCoin
//
//  Created by Khanh on 03/01/2023.
//

import Styleguide
import SwiftUI

struct CoinStatisticsSection: View {

    var body: some View {
        VStack {
            setUpCoinStatisticsItemView(
                title: Strings.MyCoin.MarketCap.title,
                price: coinDetailItem.marketCap,
                isPriceUp: coinDetailItem.isMarketCapChangePercentage24HUp,
                percentage: coinDetailItem.marketCapChangePercentage24H
            )
            setUpCoinStatisticsItemView(
                title: Strings.MyCoin.Ath.title,
                price: coinDetailItem.ath,
                isPriceUp: coinDetailItem.isAthChangePercentageUp,
                percentage: coinDetailItem.athChangePercentage
            )
            setUpCoinStatisticsItemView(
                title: Strings.MyCoin.Atl.title,
                price: coinDetailItem.atl,
                isPriceUp: coinDetailItem.isAtlChangePercentageUp,
                percentage: coinDetailItem.atlChangePercentage
            )
        }
        .padding(16.0)
    }

    private let coinDetailItem: CoinDetailItem

    init(coinDetailItem: CoinDetailItem) {
        self.coinDetailItem = coinDetailItem
    }
}

private extension CoinStatisticsSection {

    func setUpCoinStatisticsItemView(
        title: String,
        price: Decimal,
        isPriceUp: Bool,
        percentage: Double
    ) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Colors.textMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.callout))
                    .frame(height: 22.0)
                
                Text(price, format: .dollarCurrency)
                    .foregroundColor(Colors.titleMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.callout))
                    .frame(height: 28.0)
            }

            Spacer()

            isPriceUp
            ? Images.icArrowUpGreen.swiftUIImage
            : Images.icArrowDownRed.swiftUIImage

            Text(percentage, format: .percentage)
                .font(Fonts.Inter.medium.textStyle(.body))
                .foregroundColor(
                    isPriceUp
                    ? Colors.guppieGreen.swiftUIColor
                    : Colors.carnation.swiftUIColor
                )
        }
        .padding(.bottom, 24.0)
    }
}

#if DEBUG
import DomainTestHelpers

struct CoinStatisticsSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            CoinStatisticsSection(
                coinDetailItem: CoinDetailItem(
                    coinDetail: MockCoinDetail.single
                )
            )
        }
    }
}
#endif
