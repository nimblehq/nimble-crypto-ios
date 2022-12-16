//
//  TrendingCoinSection.swift
//
//  Created by Mike Pham on 15/12/2022.
//

import Styleguide
import SwiftUI

struct TrendingCoinSection: View {

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

            // TODO: - Remove dummy
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(0..<2) {_ in
                        TrendingCoinItemView()
                            .padding(.vertical, 8.0)
                    }
                }
                .padding(.horizontal, 16.0)
            }
        }
    }
}

#if DEBUG
struct TrendingCoinSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            TrendingCoinSection()
        }
    }
}
#endif
