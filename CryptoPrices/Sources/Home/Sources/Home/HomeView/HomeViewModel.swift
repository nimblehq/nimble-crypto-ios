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
}
