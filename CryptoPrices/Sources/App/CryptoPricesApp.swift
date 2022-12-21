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
import ShowTime
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
        enableVisualTouchesOnDebug()
    }
}

extension CryptoPricesApp {

    // Config showing taps and gestures on screen on DEBUG
    private func enableVisualTouchesOnDebug() {
        #if DEBUG
        ShowTime.enabled = .debugOnly
        ShowTime.fillColor = .lightGray.withAlphaComponent(0.7)
        ShowTime.strokeColor = .lightGray
        ShowTime.strokeWidth = 1
        ShowTime.disappearDelay = 0.1
        #endif
    }
}
