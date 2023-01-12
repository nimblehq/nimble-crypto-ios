//
//  CoinStatisticsSection.swift
//  MyCoin
//
//  Created by Khanh on 03/01/2023.
//
// swiftlint:disable void_function_in_ternary

import Styleguide
import SwiftUI

struct CoinStatisticsSection: View {

    var body: some View {
        VStack {
            coinStatisticsItemView(
                title: Strings.MyCoin.MarketCap.title,
                price: coinDetailItem.marketCap,
                isPriceUp: coinDetailItem.isMarketCapChangePercentage24HUp,
                percentage: coinDetailItem.marketCapChangePercentage24H
            )
            .padding(.bottom, 24.0)
            coinStatisticsItemView(
                title: Strings.MyCoin.Ath.title,
                price: coinDetailItem.ath,
                isPriceUp: coinDetailItem.isAthChangePercentageUp,
                percentage: coinDetailItem.athChangePercentage
            )
            .padding(.bottom, 24.0)
            coinStatisticsItemView(
                title: Strings.MyCoin.Atl.title,
                price: coinDetailItem.atl,
                isPriceUp: coinDetailItem.isAtlChangePercentageUp,
                percentage: coinDetailItem.atlChangePercentage
            )
        }
        .padding(16.0)
    }

    private let coinDetailItem: CoinDetailItem
    private let showData: Bool

    init(
        coinDetailItem: CoinDetailItem,
        showData: Bool
    ) {
        self.coinDetailItem = coinDetailItem
        self.showData = showData
    }
}

private extension CoinStatisticsSection {

    func coinStatisticsItemView(
        title: String,
        price: Decimal,
        isPriceUp: Bool,
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
                        .opacity(showData ? 1.0 : 0.0)
                    
                    Text(Strings.MyCoin.NoData.text)
                        .foregroundColor(Colors.titleMedium.swiftUIColor)
                        .font(Fonts.Inter.medium.textStyle(.callout))
                        .opacity(showData ? 0.0 : 1.0)
                }
            }

            Spacer()

            isPriceUp
            ? Images.icArrowUpGreen.swiftUIImage.opacity(showData ? 1.0 : 0.0)
            : Images.icArrowDownRed.swiftUIImage.opacity(showData ? 1.0 : 0.0)

            ZStack(alignment: .trailing) {
                Text(percentage, format: .percentage)
                    .font(Fonts.Inter.medium.textStyle(.body))
                    .foregroundColor(
                        isPriceUp
                        ? Colors.guppieGreen.swiftUIColor
                        : Colors.carnation.swiftUIColor
                    )
                    .opacity(showData ? 1.0 : 0.0)
                
                Text(Strings.MyCoin.NoData.text)
                    .font(Fonts.Inter.medium.textStyle(.body))
                    .opacity(showData ? 0.0 : 1.0)
            }
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
                showData: true
            )
        }
    }
}
#endif
