//
//  TrendingCoinsView.swift
//
//  Created by Mike Pham on 15/12/2022.
//

import Styleguide
import SwiftUI

struct TrendingCoinsView: View {

    @EnvironmentObject var homeState: HomeState

    var body: some View {
        VStack(spacing: 16.0) {
            ForEach(coins) { coin in
                TrendingCoinItemView(coin)
                    .onTapGesture {
                        homeState.didSelectCoin = coin.id
                    }
            }
        }
        .padding(.horizontal, 16.0)
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
            MyCoinsView(coins: Array(repeating: .mock, count: 10))
        }
    }
}
#endif
