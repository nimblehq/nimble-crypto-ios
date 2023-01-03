//
//  Container+Injection.swift
//  CryptoPrices
//
//  Created by Minh Pham on 21/12/2022.
//

import Factory
import Home
import MyCoin
import NetworkExtension
import UseCaseProtocol
import NetworkCore
import Pilot
import Repositories
import RepositoryProtocol
import UseCases

@MainActor
extension Container {

    // Network
    static let coinAPI = Factory<CoinAPIProtocol> { Pilot<CoinRoute>() }

    // ViewModels
    static let homeViewModel = Factory {
        HomeViewModel(
            myCoinsUseCase: myCoinsUseCase.callAsFunction(),
            trendingCoinsUseCase: trendingCoinsUseCase.callAsFunction()
        )
    }
    static let myCoinViewModel = Factory {
        MyCoinViewModel(
            coinDetailUseCase: coinDetailUseCase.callAsFunction()
        )
    }

    // Repositories
    static let coinRepository = Factory<CoinRepositoryProtocol> {
        CoinRepository(coinAPI: coinAPI.callAsFunction())
    }

    // UseCases
    static let myCoinsUseCase = Factory<MyCoinsUseCaseProtocol> {
        MyCoinsUseCase(repository: coinRepository.callAsFunction())
    }
    static let trendingCoinsUseCase = Factory<TrendingCoinsUseCaseProtocol> {
        TrendingCoinsUseCase(repository: coinRepository.callAsFunction())
    }
    static let coinDetailUseCase = Factory<CoinDetailUseCaseProtocol> {
        CoinDetailUseCase(repository: coinRepository.callAsFunction())
    }
}
