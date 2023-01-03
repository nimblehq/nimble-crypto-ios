//
//  CoinStatisticsSection.swift
//  MyCoin
//
//  Created by Khanh on 03/01/2023.
//

import Styleguide
import SwiftUI
import DomainTestHelpers

struct CoinStatisticsSection: View {
    
    // TODO: - Remove dummies
    var coinDetailItem = CoinDetailItem(coinDetail: MockCoinDetail.single)

    var body: some View {
        VStack {
            setUpCoinStatisticsItem(
                title: "Market Cap",
                price: coinDetailItem.marketCap,
                percentage: coinDetailItem.marketCapChangePercentage24H
            )
            setUpCoinStatisticsItem(
                title: "All Time High",
                price: coinDetailItem.ath,
                percentage: coinDetailItem.athChangePercentage
            )
            setUpCoinStatisticsItem(
                title: "All Time Low",
                price: coinDetailItem.atl,
                percentage: coinDetailItem.atlChangePercentage
            )
        }
        .padding(16.0)
    }
}

private extension CoinStatisticsSection {

    func setUpCoinStatisticsItem(
        title: String,
        price: Decimal,
        percentage: Double
    ) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Colors.textMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.callout))
                    .frame(height: 28.0)
                
                Text(price, format: .dollarCurrency)
                    .foregroundColor(Colors.titleMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.callout))
                    .frame(height: 28.0)
            }

            Spacer()

            Images.icArrowUpGreen.swiftUIImage

            Text(percentage, format: .percentage)
                .font(Fonts.Inter.medium.textStyle(.body))
                .foregroundColor(
                    Colors.guppieGreen.swiftUIColor
                )
        }
        .padding(.bottom, 24.0)
    }
}

#if DEBUG
struct CoinStatisticsSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
        }
    }
}
#endif
