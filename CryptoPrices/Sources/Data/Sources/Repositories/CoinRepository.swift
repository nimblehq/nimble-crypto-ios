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
        let chartData = try await coinAPI.getChartPrices(coinID: coinID, filter: filter)
        let dataPoints = chartData.prices.map {
            let timestamp = NSDecimalNumber(decimal: $0.first ?? 0.0).doubleValue
            let price = $0.last ?? 0.0
            return DataPoint(timestamp: timestamp, price: price)
        }
        return dataPoints
    }

    // TODO: Update implementation, for e.g. mapping errors

    public func coinDetail() async throws -> Coin {
        let apiCoin = try await coinAPI.coinDetail()
        return apiCoin as Coin
    }
}

extension APICoin: Coin {}

extension DataPoint: ChartDataPoint {}
