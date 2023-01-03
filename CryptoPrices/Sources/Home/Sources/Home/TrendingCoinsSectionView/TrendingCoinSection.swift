//
//  TrendingCoinSection.swift
//
//  Created by Mike Pham on 15/12/2022.
//

import Styleguide
import SwiftUI

struct TrendingCoinSection: View {

    @EnvironmentObject var homeState: HomeState

    var body: some View {
        VStack {
            HStack {
                Text(Strings.Home.TrendingCoins.title)
                    .foregroundColor(Colors.titleMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.callout))

                Spacer()

                Button(Strings.Home.SeeAll.text) {}
                    .foregroundColor(Colors.caribbeanGreen.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.subheadline))
            }
            .padding(16.0)

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(coins) { coin in
                        TrendingCoinItemView(coin)
                            .padding(.vertical, 8.0)
                            .onTapGesture {
                                homeState.didSelectCoin = coin.id
                            }
                    }
                }
                .padding(.horizontal, 16.0)
            }
        }
    }

    private let coins: [TrendingCoinItem]

    init(coins: [TrendingCoinItem]) {
        self.coins = coins
    }
}

#if DEBUG
struct TrendingCoinSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinSection(coins: Array(repeating: .mock, count: 10))
        }
    }
}
#endif
