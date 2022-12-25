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

    @StateObject var appCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppView()
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
