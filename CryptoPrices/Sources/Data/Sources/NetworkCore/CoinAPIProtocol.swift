//
//  CoinAPIProtocol.swift
//  Data
//
//  Created by Doan Thieu on 01/12/2022.
//

// sourcery: AutoMockable
public protocol CoinAPIProtocol {

    // TODO: Update when implement
    func myCoins() async throws -> [APICoin]
    func trendingCoins(coinIDs: [String]) async throws -> [APICoin]
    func getChartPrices(coinID: String, numberOfDays: String) async throws -> APIPrices
    func coinDetail(id: String) async throws -> APICoinDetail
}
