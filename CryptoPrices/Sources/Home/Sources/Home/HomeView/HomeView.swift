//  HomeView.swift
//  Home
//
//  Created by Doan Thieu on 04/12/2022.
//

import Styleguide
import SwiftUI

public struct HomeView: View {

    public var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40.0) {
                    headerView
                    WalletStatisticSection()
                    MyCoinSection(coins: viewModel.myCoins)
                    TrendingCoinSection()
                }
            }
            .padding(.top, 24.0)
            .clipped(antialiased: false)
            .frame(maxHeight: .infinity)
            .background(Colors.bgMain.swiftUIColor)
            .task {
                await viewModel.fetchMyCoins()
            }
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
        Preview {
            HomeView(viewModel: HomeViewModel(myCoinsUseCase: MockMyCoinsUseCase()))
        }
    }
}
#endif
