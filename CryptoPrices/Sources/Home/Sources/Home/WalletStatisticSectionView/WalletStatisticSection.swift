//
//  WalletStatisticSection.swift
//  Home
//
//  Created by Minh Pham on 07/12/2022.
//

import Styleguide
import SwiftUI

struct WalletStatisticSection: View {

    var body: some View {
        VStack(spacing: 40.0) {
            totalCoins
            todayProfit
        }
        .padding(.horizontal, 32.0)
        .padding(.vertical, 32.0)
        .background(gradientBackground)
    }
}

private extension WalletStatisticSection {

    var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Colors.metallicSeaweed.swiftUIColor,
                    Colors.tiffanyBlue.swiftUIColor
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .cornerRadius(12.0)
        .padding(.horizontal, 16.0)
        .shadow(color: Colors.tiffanyBlue.swiftUIColor, radius: 16.0, x: 0.0, y: 16.0)
    }

    var totalCoins: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(Strings.Home.TotalCoins.title)
                    .foregroundColor(Colors.lightSilver.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.body))

                // TODO: Remove hard-coded data
                Text(7_273_291, format: .dollarCurrency)
                    .foregroundColor(.white)
                    .font(Fonts.Inter.semiBold.textStyle(.title))
            }

            Spacer()
        }
    }

    var todayProfit: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(Strings.Home.TodayProfit.title)
                    .foregroundColor(Colors.lightSilver.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.body))

                // TODO: Remove hard-coded data
                Text(193.28, format: .dollarCurrency)
                    .foregroundColor(.white)
                    .font(Fonts.Inter.semiBold.textStyle(.title))
            }

            Spacer()

            Button(action: {}, label: {
                HStack {
                    Images.icArrowUpGreen.swiftUIImage
                    // TODO: Remove hard-coded data
                    Text(2.41, format: .percentage)
                        .font(Fonts.Inter.medium.textStyle(.body))
                }
            })
            .padding(EdgeInsets(top: 8.0, leading: 10.0, bottom: 8.0, trailing: 10.0))
            .foregroundColor(Colors.guppieGreen.swiftUIColor)
            .background(Colors.water.swiftUIColor)
            .cornerRadius(20.0)
        }
    }
}

#if DEBUG
struct WalletStatisticSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            WalletStatisticSection()
        }
    }
}
#endif
