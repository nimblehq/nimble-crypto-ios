//
//  CoinAPIProtocol.swift
//  Data
//
//  Created by Doan Thieu on 01/12/2022.
//

import Entities

// sourcery: AutoMockable
public protocol CoinAPIProtocol {

    // TODO: Update when implement
    func myCoins() async throws -> [APICoin]
    func trendingCoins(coinIDs: [String]) async throws -> [APICoin]
    func coinDetail() async throws -> APICoin
    func getChartPrices(coinID: String, filter: TimeFilter) async throws -> APIPrices
}
