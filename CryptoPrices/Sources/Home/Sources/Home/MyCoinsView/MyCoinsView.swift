//
//  MyCoinsView.swift
//
//  Created by Khanh on 12/12/2022.
//

import Styleguide
import SwiftUI

struct MyCoinsView: View {

    @EnvironmentObject var homeState: HomeState

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16.0) {
                ForEach(coins) { coin in
                    MyCoinItemView(coin)
                        .onTapGesture {
                            homeState.didSelectCoin = coin.id
                        }
                }
            }
            .padding(.horizontal, 16.0)
        }
    }

    private let coins: [MyCoinItem]

    init(coins: [MyCoinItem]) {
        self.coins = coins
    }
}

#if DEBUG
struct MyCoinSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinsView(coins: Array(repeating: .mock, count: 10))
        }
    }
}
#endif
