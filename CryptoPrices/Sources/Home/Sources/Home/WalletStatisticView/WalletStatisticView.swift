//
//  WalletStatisticView.swift
//  Home
//
//  Created by Minh Pham on 07/12/2022.
//

import Styleguide
import SwiftUI

struct WalletStatisticView: View {

    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 40.0) {
                totalCoins
                todayProfit
            }
            .padding(.horizontal, 16.0)
            .padding(.vertical, 32.0)
        }
        .background(mainBackground)
        .background(blurBackground)
        .padding(.horizontal, 16.0)
        .padding(.bottom, 32.0)
    }
}

private extension WalletStatisticView {

    var gradient: Gradient {
        Gradient(
            colors: [
                Colors.metallicSeaweed.swiftUIColor,
                Colors.tiffanyBlue.swiftUIColor
            ]
        )
    }

    var mainBackground: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .cornerRadius(12.0)
    }

    var blurBackground: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .leading,
            endPoint: .trailing
        )
        .cornerRadius(12.0)
        .padding(16.0)
        .offset(x: 0.0, y: 32.0)
        .blur(radius: 16.0)
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
            .buttonStyle(.borderless)
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
            WalletStatisticView()
        }
    }
}
#endif
