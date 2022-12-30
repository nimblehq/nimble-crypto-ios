//  HomeView.swift
//  Home
//
//  Created by Doan Thieu on 04/12/2022.
//

import UseCaseProtocol
import Styleguide
import SwiftUI

public struct HomeView: View {

    public var body: some View {
        ScrollView {
            VStack(spacing: 40.0) {
                headerView
                WalletStatisticSection()
                MyCoinSection(coins: viewModel.myCoins)
                if !viewModel.trendingCoins.isEmpty {
                    TrendingCoinSection(coins: viewModel.trendingCoins)
                }
            }
        }
        .padding(.top, 24.0)
        .clipped(antialiased: false)
        .frame(maxHeight: .infinity)
        .background(Colors.bgMain.swiftUIColor)
        .task {
            await viewModel.fetchMyCoins()
            await viewModel.fetchTrendingCoins()
        }
    }

    @ObservedObject private var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

private extension HomeView {

    var headerView: some View {
        Text(Strings.Home.Title.text)
            .multilineTextAlignment(.center)
            .font(Fonts.Inter.bold.textStyle(.title))
    }
}

#if DEBUG
import DomainTestHelpers

struct HomeView_Previews: PreviewProvider {

    static var previews: some View {
        let homeViewModel = HomeViewModel(
            myCoinsUseCase: MockMyCoinsUseCaseProtocol(),
            trendingCoinsUseCase: MockTrendingCoinsUseCaseProtocol()
        )
        return Preview { HomeView(viewModel: homeViewModel) }
    }
}
#endif
