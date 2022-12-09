//
//  CoinRepository.swift
//  Data
//
//  Created by Doan Thieu on 29/11/2022.
//

import Entities
import RepositoryProtocol

public class CoinRepository: CoinRepositoryProtocol {

    private let coinAPI: CoinAPIProtocol

    public init(coinAPI: CoinAPIProtocol) {
        self.coinAPI = coinAPI
    }

    // TODO: Update implementation, for e.g. mapping errors

    public func myCoins() async throws -> [Coin] {
        return try await coinAPI.myCoins().map { $0 as Coin }
    }

    public func trendingCoins() async throws -> [Coin] {
        return try await coinAPI.trendingCoins().map { $0 as Coin }
    }

    public func coinDetail() async throws -> Coin {
        let apiCoin = try await coinAPI.coinDetail()
        return apiCoin as Coin
    }
}

extension APICoin: Coin {}
