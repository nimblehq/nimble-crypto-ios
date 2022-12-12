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

    public init(myCoinsReturnValue: Result<[Coin], Error>? = nil) {
        self.myCoinsReturnValue = myCoinsReturnValue
    }

    public func myCoins() async throws -> [Coin] {
        guard let myCoinsReturnValue = myCoinsReturnValue else {
            fatalError("myCoinsReturnValue was not set!")
        }

        switch myCoinsReturnValue {
        case let .success(myCoins): return myCoins
        case let .failure(error): throw error
        }
    }

    public func trendingCoins() async throws -> [Coin] {
        fatalError("not implemented")
    }

    public func coinDetail() async throws -> Coin {
        fatalError("not implemented")
    }
}
