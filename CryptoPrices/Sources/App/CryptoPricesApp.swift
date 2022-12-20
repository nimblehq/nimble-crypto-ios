//
//  CryptoPricesApp.swift
//  CryptoPrices
//
//  Created by Doan Thieu on 28/11/2022.
//

import Home
import NetworkExtension
import Pilot
import Repositories
import MyCoin
import Styleguide
import SwiftUI
import UseCases

@main
struct CryptoPricesApp: App {

    // TODO: Apply DI instead of manually initializing
    private let network = Pilot<CoinRoute>()

    @StateObject var appCoordinator = AppCoordinator()

    var body: some Scene {
        // TODO: Apply DI instead of manually initializing
        WindowGroup {
            switch appCoordinator.state {
            case let .home(homeState):
                HomeView(
                    viewModel: HomeViewModel(
                        myCoinsUseCase: MyCoinsUseCase(
                            repository: CoinRepository(coinAPI: network)
                        )
                    )
                )
                    .environmentObject(homeState)
            case let .myCoin(myCoinState):
                MyCoinView()
                    .environmentObject(myCoinState)
                    .transition(
                        .move(edge: .trailing)
                        .animation(.linear(duration: 1.0))
                    )
            }
        }
    }

    init() {
        Fonts.registerAllCustomFonts()
    }
}
