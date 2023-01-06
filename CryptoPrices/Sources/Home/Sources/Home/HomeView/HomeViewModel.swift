//
//  HomeViewModel.swift
//  Home
//
//  Created by Doan Thieu on 14/12/2022.
//

import SwiftUI
import UseCaseProtocol

@MainActor public final class HomeViewModel: ObservableObject {

    private let myCoinsUseCase: MyCoinsUseCaseProtocol
    private let trendingCoinsUseCase: TrendingCoinsUseCaseProtocol

    @Published public private(set) var myCoins: [MyCoinItem] = []
    @Published public private(set) var trendingCoins: [TrendingCoinItem] = []

    public init(
        myCoinsUseCase: MyCoinsUseCaseProtocol,
        trendingCoinsUseCase: TrendingCoinsUseCaseProtocol
    ) {
        self.myCoinsUseCase = myCoinsUseCase
        self.trendingCoinsUseCase = trendingCoinsUseCase
    }

    public func fetchMyCoins() async {
        do {
            myCoins = try await myCoinsUseCase.execute()
                .map(MyCoinItem.init)
        } catch {
            // TODO: Handle errors
        }
    }

    public func fetchTrendingCoins() async {
        // The list of trending coins are provided as per the requirement from this backend task:
        // https://github.com/nimblehq/nimble-crypto-ios/issues/9
        let trendingCoinIDs = [
            "bitcoin",
            "ethereum",
            "binancecoin",
            "ripple",
            "cardano",
            "solana",
            "polkadot",
            "near",
            "tron",
            "dogecoin"
        ]
        do {
            trendingCoins = try await trendingCoinsUseCase.execute(coinIDs: trendingCoinIDs)
                .map(TrendingCoinItem.init)
        } catch {
            // TODO: Handle errors
        }
    }

    public func fetchAllData() async {
        // Make `fetchMyCoins` and `fetchTrendingCoins` run in parallel
        await withTaskGroup(of: Void.self) { taskGroup in
            taskGroup.addTask { await self.fetchMyCoins() }
            taskGroup.addTask { await self.fetchTrendingCoins() }
        }
    }
}
