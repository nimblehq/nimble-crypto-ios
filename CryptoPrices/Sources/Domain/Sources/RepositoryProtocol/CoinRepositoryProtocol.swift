//
//  CoinRepositoryProtocol.swift
//  Domain
//
//  Created by Doan Thieu on 01/12/2022.
//

import Entities

// sourcery: AutoMockable
public protocol CoinRepositoryProtocol {

    // TODO: Update when implement
    func myCoins() async throws -> [Coin]
    func trendingCoins(coinIDs: [String]) async throws -> [Coin]
    func coinDetail() async throws -> Coin
    func getChartPrices(coinID: String, filter: TimeFilter) async throws -> [ChartDataPoint]
}
