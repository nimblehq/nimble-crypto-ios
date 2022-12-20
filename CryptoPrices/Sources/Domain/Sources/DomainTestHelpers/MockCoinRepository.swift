//
//  DomainTestHelpers.swift
//  Domain
//
//  Created by Doan Thieu on 12/12/2022.
//

import Entities
import RepositoryProtocol

// TODO: - Set up code generator for generating mock types (e.g. Sourcery)

public class MockCoinRepository: CoinRepositoryProtocol {

    public var myCoinsReturnValue: Result<[Coin], Error>?
    public var trendingCoinsReturnValue: Result<[Coin], Error>?

    public init() {}

    public func myCoins() async throws -> [Coin] {
        guard let myCoinsReturnValue = myCoinsReturnValue else {
            fatalError("myCoinsReturnValue was not set!")
        }

        switch myCoinsReturnValue {
        case let .success(myCoins): return myCoins
        case let .failure(error): throw error
        }
    }

    public func trendingCoins(coinIDs: [String]) async throws -> [Coin] {
        guard let trendingCoinsReturnValue = trendingCoinsReturnValue else {
            fatalError("trendingCoinsReturnValue was not set!")
        }

        switch trendingCoinsReturnValue {
        case let .success(trendingCoins): return trendingCoins
        case let .failure(error): throw error
        }
    }

    public func coinDetail() async throws -> Coin {
        fatalError("not implemented")
    }
}
