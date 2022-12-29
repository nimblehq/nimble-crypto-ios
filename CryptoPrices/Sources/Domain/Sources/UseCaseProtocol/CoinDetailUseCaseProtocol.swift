//
//  CoinDetailUseCaseProtocol.swift
//
//  Created by Khanh on 27/12/2022.
//

import Entities

// sourcery: AutoMockable
public protocol CoinDetailUseCaseProtocol {

    func execute(id: String) async throws -> CoinDetail
}
