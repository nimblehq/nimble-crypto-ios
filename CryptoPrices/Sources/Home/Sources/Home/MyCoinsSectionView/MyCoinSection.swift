//
//  MyCoinSection.swift
//
//  Created by Khanh on 12/12/2022.
//

import Styleguide
import SwiftUI

struct MyCoinSection: View {

    @EnvironmentObject var homeState: HomeState

    var body: some View {
        VStack {
            HStack {
                Text(Strings.Home.MyCoin.title)
                    .foregroundColor(Colors.titleMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.callout))
                
                Spacer()

                Button(Strings.Home.SeeAll.text) {}
                    .foregroundColor(Colors.caribbeanGreen.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.subheadline))
            }
            .padding(16.0)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(coins) { coin in
                        MyCoinItemView(coin)
                            .padding(.trailing, 8.0)
                            .onTapGesture {
                                withAnimation {
                                    homeState.didSelectCoin = coin.id
                                }
                            }
                    }
                }
                .padding(.leading, 16.0)
            }
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
            MyCoinSection(coins: Array(repeating: .mock, count: 10))
        }
    }
}
#endif
