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

    public init(myCoinsReturnValue: Result<[APICoin], Error>? = nil) {
        self.myCoinsReturnValue = myCoinsReturnValue
    }

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
        fatalError("not implemented")
    }

    public func coinDetail() async throws -> APICoin {
        fatalError("not implemented")
    }
}
