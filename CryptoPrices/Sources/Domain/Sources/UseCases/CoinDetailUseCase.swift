//
//  CoinDetailUseCase.swift
//  Domain
//
//  Created by Khanh on 27/12/2022.
//

import Entities
import RepositoryProtocol
import UseCaseProtocol

public class CoinDetailUseCase: CoinDetailUseCaseProtocol {

    private let repository: CoinRepositoryProtocol

    public init(repository: CoinRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: String) async throws -> CoinDetail {
        try await repository.coinDetail(id: id)
    }
}
