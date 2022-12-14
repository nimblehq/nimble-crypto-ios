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
import Styleguide
import SwiftUI
import UseCases

@main
struct CryptoPricesApp: App {

    private let network = Pilot<CoinRoute>()

    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: HomeViewModel(
                    myCoinsUseCase: MyCoinsUseCase(
                        repository: CoinRepository(coinAPI: network)
                    )
                )
            )
        }
    }

    init() {
        Fonts.registerAllCustomFonts()
    }
}
