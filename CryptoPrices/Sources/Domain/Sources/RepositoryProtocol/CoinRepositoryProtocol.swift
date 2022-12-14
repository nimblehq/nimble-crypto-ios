//
//  CoinRepositoryProtocol.swift
//  Domain
//
//  Created by Doan Thieu on 01/12/2022.
//

import Entities

public protocol CoinRepositoryProtocol {

    // TODO: Update when implement
    func myCoins() async throws -> [Coin]
    func trendingCoins() async throws -> [Coin]
    func coinDetail() async throws -> Coin
}
