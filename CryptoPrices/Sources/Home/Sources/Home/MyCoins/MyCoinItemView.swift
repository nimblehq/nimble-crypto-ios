//
//  MyCoinItemView.swift
//
//  Created by Khanh on 07/12/2022.
//

import Styleguide
import SwiftUI

struct MyCoinItemView: View {
    
    // TODO: - Remove dummy
    var percentage = 6.21

    var body: some View {
        VStack {
            VStack {
                HStack {
                    coinImage
                    coinInfo
                    Spacer()
                }

                HStack {
                    currentPrice
                    Spacer()
                    priceChangePercentage
                }
                .padding(.top, 14.0)
            }
            .padding(8.0)
        }
        .frame(width: 180.0, height: 114.0)
        .background(Assets.Colors.bgCurrencyItem.swiftUIColor)
        .cornerRadius(12.0)
    }
}

private extension MyCoinItemView {

    var coinImage: some View {
        // TODO: - Remove dummy
        Assets.Images.icBitcoin.swiftUIImage
            .frame(width: 40.0, height: 40.0)
            .clipShape(Circle())
    }
    
    var coinInfo: some View {
        // TODO: - Remove dummy
        VStack(alignment: .leading) {
            Text("BTC")
                .foregroundColor(Assets.Colors.textBold.swiftUIColor)
                .font(.Inter.bold.font(for: .callout))
                .padding(.bottom, 4.0)

            Text("Bitcoin")
                .foregroundColor(Assets.Colors.textMedium.swiftUIColor)
                .font(.Inter.medium.font(for: .subheadline))
        }
    }
    
    var currentPrice: some View {
        // TODO: - Remove dummy
        Text("$24,209")
            .foregroundColor(Assets.Colors.textBold.swiftUIColor)
            .font(.Inter.bold.font(for: .callout))
    }
    
    var priceChangePercentage: some View {
        // TODO: - Remove dummy
        HStack {
            percentage < 0.0
            ? Assets.Images.icArrowDownRed.swiftUIImage
            : Assets.Images.icArrowUpGreen.swiftUIImage

            Text("6.21%")
                .font(.Inter.medium.font(for: .callout))
                .foregroundColor(
                    percentage < 0.0
                    ? Assets.Colors.carnation.swiftUIColor
                    : Assets.Colors.guppieGreen.swiftUIColor
                )
        }
    }
}

#if DEBUG
struct MyCoinItemView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinItemView()
        }
    }
}
#endif
