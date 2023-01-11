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
            coinStatisticsItemView(
                title: Strings.MyCoin.MarketCap.title,
                price: coinDetailItem.marketCap,
                percentage: coinDetailItem.marketCapChangePercentage24H
            )
            .padding(.bottom, 24.0)

            coinStatisticsItemView(
                title: Strings.MyCoin.Ath.title,
                price: coinDetailItem.ath,
                percentage: coinDetailItem.athChangePercentage
            )
            .padding(.bottom, 24.0)

            coinStatisticsItemView(
                title: Strings.MyCoin.Atl.title,
                price: coinDetailItem.atl,
                percentage: coinDetailItem.atlChangePercentage
            )
        }
        .padding(16.0)
    }

    private let coinDetailItem: CoinDetailItem
    private let shouldShowData: Bool

    init(
        coinDetailItem: CoinDetailItem,
        shouldShowData: Bool
    ) {
        self.coinDetailItem = coinDetailItem
        self.shouldShowData = shouldShowData
    }
}

private extension CoinStatisticsSection {

    func coinStatisticsItemView(
        title: String,
        price: Decimal,
        percentage: Double
    ) -> some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 10.0
            ) {
                Text(title)
                    .foregroundColor(Colors.textMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.caption))

                ZStack(alignment: .leading) {
                    Text(price, format: .dollarCurrency)
                        .foregroundColor(Colors.titleMedium.swiftUIColor)
                        .font(Fonts.Inter.medium.textStyle(.callout))
                        .opacity(shouldShowData ? 1.0 : 0.0)
                    
                    Text(Strings.MyCoin.NoData.text)
                        .foregroundColor(Colors.titleMedium.swiftUIColor)
                        .font(Fonts.Inter.medium.textStyle(.callout))
                        .opacity(shouldShowData ? 0.0 : 1.0)
                }
            }

            Spacer()

            PercentageView(percentage)
                .font(Fonts.Inter.medium.textStyle(.body))
                .opacity(shouldShowData ? 1.0 : 0.0)
        }
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
                ),
                shouldShowData: true
            )
        }
    }
}
#endif
