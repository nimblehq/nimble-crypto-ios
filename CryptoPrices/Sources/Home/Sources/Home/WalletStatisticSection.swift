//
//  WalletStatisticSection..swift
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
            gradient: Gradient(colors: [.metallicSeaweed, .tiffanyBlue]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .cornerRadius(12.0)
        .padding(.horizontal, 16.0)
        .shadow(color: .tiffanyBlue, radius: 16.0, x: 0.0, y: 16.0)
    }

    var totalCoins: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(Strings.Home.totalCoinsTitle)
                    .foregroundColor(.lightSilver)
                    .font(.Inter.medium.font(for: .callout))

                Text("$7,273,291") // TODO: Handle showing this number with device locale
                    .foregroundColor(.white)
                    .font(.Inter.bold.font(for: .title2))
            }

            Spacer()
        }
    }

    var todayProfit: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(Strings.Home.todayProfitTitle)
                    .foregroundColor(.lightSilver)
                    .font(.Inter.medium.font(for: .callout))

                Text("$193,28") // TODO: Handle showing this number with device locale
                    .foregroundColor(.white)
                    .font(.Inter.bold.font(for: .title2))
            }

            Spacer()

            Button(action: {}, label: {
                HStack {
                    Image("ic_arrow_up_green")
                    Text("2.41%")
                }
            })
            .padding(EdgeInsets(top: 8.0, leading: 10.0, bottom: 8.0, trailing: 10.0))
            .foregroundColor(.guppieGreen)
            .background(Color.water)
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
