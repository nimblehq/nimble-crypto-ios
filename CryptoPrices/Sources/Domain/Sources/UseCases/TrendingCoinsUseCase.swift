//
//  TrendingCoinsUseCase.swift
//  Domain
//
//  Created by Minh Pham on 16/12/2022.
//

import Entities
import RepositoryProtocol
import UseCaseProtocol

public class TrendingCoinsUseCase: TrendingCoinsUseCaseProtocol {

    private let repository: CoinRepositoryProtocol

    public init(repository: CoinRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(coinIDs: [String]) async throws -> [Coin] {
        return try await repository.trendingCoins(coinIDs: coinIDs)
    }
}
