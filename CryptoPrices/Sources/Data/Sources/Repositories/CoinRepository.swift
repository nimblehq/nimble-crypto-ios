//
//  CoinRepository.swift
//  Data
//
//  Created by Doan Thieu on 29/11/2022.
//

import Entities
import Foundation
import NetworkCore
import RepositoryProtocol

public class CoinRepository: CoinRepositoryProtocol {

    private let coinAPI: CoinAPIProtocol

    public init(coinAPI: CoinAPIProtocol) {
        self.coinAPI = coinAPI
    }

    public func myCoins() async throws -> [Coin] {
        return try await coinAPI.myCoins().map { $0 as Coin }
    }

    public func trendingCoins(coinIDs: [String]) async throws -> [Coin] {
        return try await coinAPI.trendingCoins(coinIDs: coinIDs).map { $0 as Coin }
    }

    public func getChartPrices(coinID: String, filter: TimeFilter) async throws -> [ChartDataPoint] {
        let chartData = try await coinAPI.getChartPrices(
            coinID: coinID,
            numberOfDays: filter.daysCount.description
        )
        let dataPoints = chartData.toDataPoints()
        return dataPoints
    }

    // TODO: Update implementation, for e.g. mapping errors

    public func coinDetail(id: String) async throws -> Coin {
        let apiCoin = try await coinAPI.coinDetail(id: id)
        return apiCoin as Coin
    }
}

extension APICoin: Coin {}

extension DataPoint: ChartDataPoint {}
