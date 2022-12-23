//
//  CryptoPricesApp.swift
//  CryptoPrices
//
//  Created by Doan Thieu on 28/11/2022.
//

import Factory
import Home
import MyCoin
import ShowTime
import Styleguide
import SwiftUI
import UseCases
import WormholySwift

@main
struct CryptoPricesApp: App {
// note
    @StateObject var appCoordinator = AppCoordinator()

    @Injected(Container.homeViewModel) private var homeViewModel

    var body: some Scene {
        WindowGroup {
            switch appCoordinator.state {
            case let .home(homeState):
                HomeView(viewModel: homeViewModel)
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
        configureWormhly()
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

    private func configureWormhly() {
        #if !DEBUG
        Wormholy.shakeEnabled = false
        #endif
    }
}
