//
//  MockMyCoinsUseCase.swift
//  Domain
//
//  Created by Doan Thieu on 16/12/2022.
//

import Entities
import UseCaseProtocol

// TODO: - Set up code generator for generating mock types (e.g. Sourcery)

public class MockMyCoinsUseCase: MyCoinsUseCaseProtocol {

    public var myCoinsReturnValue: Result<[Coin], Error>?

    public init(myCoinsReturnValue: Result<[Coin], Error>? = nil) {
        self.myCoinsReturnValue = myCoinsReturnValue
    }

    public func execute() async throws -> [Coin] {
        guard let myCoinsReturnValue = myCoinsReturnValue else {
            fatalError("myCoinsReturnValue was not set!")
        }

        switch myCoinsReturnValue {
        case let .success(myCoins): return myCoins
        case let .failure(error): throw error
        }
    }
}
