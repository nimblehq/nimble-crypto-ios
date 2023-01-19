//  HomeView.swift
//  Home
//
//  Created by Doan Thieu on 04/12/2022.
//

import UseCaseProtocol
import Styleguide
import SwiftUI

private typealias Section = Styleguide.Section

public struct HomeView: View {

    public var body: some View {
        List {
            headerSection

            myCoinsSection
                .renderIf(!viewModel.myCoins.isEmpty)

            trendingCoinsSection
                .renderIf(!viewModel.trendingCoins.isEmpty)
        }
        .listStyle(.plain)
        .background(Colors.bgMain.swiftUIColor)
        .safeAreaInset(edge: .top, spacing: 0.0, content: {
            EmptyView()
                .frame(height: 1.0)
                .background(Colors.bgMain.swiftUIColor)
        })
        .spinner(isPresented: $showingSpinner)
        .task {
            await viewModel.fetchAllData()
        }
        .refreshable {
            await viewModel.fetchAllData(isRefreshing: true)
        }
        .onReceive(viewModel.$isFetchingData) {
            showingSpinner = $0
        }
    }

    @ObservedObject private var viewModel: HomeViewModel
    @State private var showingSpinner = false

    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

private extension HomeView {

    var headerSection: some View {
        Section {
            Text(Strings.Home.Title.text)
                .multilineTextAlignment(.center)
                .font(Fonts.Inter.semiBold.textStyle(.title))
                .padding(.top, 24.0)
                .padding(.bottom, 40.0)

            WalletStatisticView()
        }
    }

    var myCoinsSection: some View {
        Section {
            MyCoinsView(coins: viewModel.myCoins)
        } header: {
            HomeHeader(
                title: Strings.Home.MyCoins.title,
                actionTitle: Strings.Home.SeeAll.text,
                action: {}
            )
        }
    }

    var trendingCoinsSection: some View {
        Section {
            TrendingCoinsView(coins: viewModel.trendingCoins)
        } header: {
            HomeHeader(
                title: Strings.Home.TrendingCoins.title,
                actionTitle: Strings.Home.SeeAll.text,
                action: {}
            )
        }
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
