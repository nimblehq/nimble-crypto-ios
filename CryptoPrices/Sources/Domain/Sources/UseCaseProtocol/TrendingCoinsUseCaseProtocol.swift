//
//  TrendingCoinsUseCaseProtocol.swift
//  Domain
//
//  Created by Minh Pham on 16/12/2022.
//

import Entities

public protocol TrendingCoinsUseCaseProtocol {

    func execute(coinIDs: [String]) async throws -> [Coin]
}
