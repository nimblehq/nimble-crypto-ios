//
//  MyCoinsUseCase.swift
//  Domain
//
//  Created by Doan Thieu on 01/12/2022.
//

import Entities
import RepositoryProtocol
import UseCaseProtocol

public class MyCoinsUseCase: MyCoinsUseCaseProtocol {

    private let repository: CoinRepositoryProtocol

    public init(repository: CoinRepositoryProtocol) {
        self.repository = repository
    }

    // TODO: Update when implement
    public func execute() async throws -> [Coin] {
        return try await repository.myCoins()
    }
}
