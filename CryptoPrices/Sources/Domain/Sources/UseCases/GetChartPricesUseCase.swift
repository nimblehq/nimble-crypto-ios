//
//  GetChartPricesUseCase.swift
//  Domain
//
//  Created by Minh Pham on 27/12/2022.
//

import Entities
import NetworkCore
import RepositoryProtocol
import UseCaseProtocol

public class GetChartPricesUseCase: GetChartPricesUseCaseProtocol {

    private let repository: CoinRepositoryProtocol

    public init(repository: CoinRepositoryProtocol) {
        self.repository = repository
    }

    // TODO: Update when implement
    public func execute(coinID: String, filter: TimeFilter) async throws -> [ChartDataPoint] {
        return try await repository.getChartPrices(coinID: coinID, filter: filter)
    }
}
