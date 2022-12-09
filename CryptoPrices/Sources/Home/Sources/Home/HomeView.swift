//  HomeView.swift
//  Home
//
//  Created by Doan Thieu on 04/12/2022.
//

import Styleguide
import SwiftUI
import MyCoin

public struct HomeView: View {

    public var body: some View {
        ScrollView {
            VStack(spacing: 40.0) {
                homeTitle
                WalletStatisticSection()

                HStack {
                    Text("My Coins 😎")
                        .font(.Inter.bold.font(for: .callout))

                    Spacer()

                    Button("see all ->") {}
                        .foregroundColor(.caribbeanGreen)
                        .font(.Inter.medium.font(for: .subheadline))
                }
                .padding(.leading, 16.0)
                .padding(.trailing, 16.0)

                MyCoinView()
            }
        }
        .padding(.top, 24.0)
        .clipped(antialiased: false)
        .frame(maxHeight: .infinity)
    }

    var homeTitle: some View {
        Text(Strings.Home.titleText)
            .multilineTextAlignment(.center)
            .font(.Inter.bold.font(for: .title2))
    }

    public init() {}
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            HomeView()
        }
    }
}
#endif
