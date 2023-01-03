//
//  GetChartPricesUseCaseProtocol.swift
//  Domain
//
//  Created by Minh Pham on 27/12/2022.
//

import Entities

// sourcery: AutoMockable
public protocol GetChartPricesUseCaseProtocol {

    func execute(coinID: String, filter: TimeFilter) async throws -> [ChartDataPoint]
}
