//
//  Pilot+CoinAPI.swift
//  Data
//
//  Created by Doan Thieu on 01/12/2022.
//

import NetworkCore
import Pilot

extension Pilot: CoinAPIProtocol where R == CoinRoute {

    public func myCoins() async throws -> [APICoin] {
        return try await request(
            .myCoins(MyCoinsParameters(perPage: 10, page: 1)),
            target: [APICoin].self,
            decoder: .apiDecoder
        )
    }

    public func trendingCoins(coinIDs: [String]) async throws -> [APICoin] {
        return try await request(
            .trendingCoins(TrendingCoinsParameters(ids: coinIDs.joined(separator: ","), perPage: 10, page: 1)),
            target: [APICoin].self,
            decoder: .apiDecoder
        )
    }

    public func coinDetail(id: String) async throws -> APICoinDetail {
        return try await request(
            .coinDetail(id),
            target: APICoinDetail.self,
            decoder: .apiDecoder
        )
    }

    public func getChartPrices(coinID: String, numberOfDays: String) async throws -> APIPrices {
        return try await request(
            .chart(GetChartPricesParameters(id: coinID, days: numberOfDays)),
            target: APIPrices.self,
            decoder: .apiDecoder
        )
    }
}
