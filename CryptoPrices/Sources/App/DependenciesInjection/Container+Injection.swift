//
//  Container+Injection.swift
//  CryptoPrices
//
//  Created by Minh Pham on 21/12/2022.
//

import Factory
import Home
import MyCoin
import NetworkCore
import NetworkExtension
import Pilot
import Repositories
import RepositoryProtocol
import UseCaseProtocol
import UseCases

@MainActor
extension Container {

    // Network
    static let coinAPI = Factory<CoinAPIProtocol>(scope: .cached) { Pilot<CoinRoute>() }

    // ViewModels
    static let homeViewModel = Factory(scope: .cached) {
        HomeViewModel(
            myCoinsUseCase: myCoinsUseCase.callAsFunction(),
            trendingCoinsUseCase: trendingCoinsUseCase.callAsFunction()
        )
    }

    static let myCoinViewModel = Factory {
        MyCoinViewModel(
            coinDetailUseCase: coinDetailUseCase.callAsFunction(),
            getChartPricesUseCase: getChartPricesUseCase.callAsFunction()
        )
    }

    // Repositories
    static let coinRepository = Factory<CoinRepositoryProtocol>(scope: .cached) {
        CoinRepository(coinAPI: coinAPI.callAsFunction())
    }

    // UseCases
    static let myCoinsUseCase = Factory<MyCoinsUseCaseProtocol>(scope: .cached) {
        MyCoinsUseCase(repository: coinRepository.callAsFunction())
    }

    static let trendingCoinsUseCase = Factory<TrendingCoinsUseCaseProtocol>(scope: .cached) {
        TrendingCoinsUseCase(repository: coinRepository.callAsFunction())
    }

    static let coinDetailUseCase = Factory<CoinDetailUseCaseProtocol>(scope: .cached) {
        CoinDetailUseCase(repository: coinRepository.callAsFunction())
    }

    static let getChartPricesUseCase = Factory<GetChartPricesUseCaseProtocol>(scope: .cached) {
        GetChartPricesUseCase(repository: coinRepository.callAsFunction())
    }
}
