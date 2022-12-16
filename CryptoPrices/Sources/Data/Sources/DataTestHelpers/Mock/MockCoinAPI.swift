//
//  MockCoinAPI.swift
//  Data
//
//  Created by Doan Thieu on 09/12/2022.
//

import NetworkCore

// TODO: - Set up code generator for generating mock types (e.g. Sourcery)

public class MockCoinAPI: CoinAPIProtocol {

    public var myCoinsReturnValue: Result<[APICoin], Error>?
    public var trendingCoinsReturnValue: Result<[APICoin], Error>?

    public init() {}

    public func myCoins() async throws -> [APICoin] {
        guard let myCoinsReturnValue = myCoinsReturnValue else {
            fatalError("myCoinsReturnValue was not set!")
        }

        switch myCoinsReturnValue {
        case let .success(myCoins): return myCoins
        case let .failure(error): throw error
        }
    }

    public func trendingCoins() async throws -> [APICoin] {
        guard let trendingCoinsReturnValue = trendingCoinsReturnValue else {
            fatalError("trendingCoinsReturnValue was not set!")
        }

        switch trendingCoinsReturnValue {
        case let .success(trendingCoins): return trendingCoins
        case let .failure(error): throw error
        }
    }

    public func coinDetail() async throws -> APICoin {
        fatalError("not implemented")
    }
}
