//
//  MyCoinsUseCaseProtocol.swift
//  Domain
//
//  Created by Doan Thieu on 01/12/2022.
//

import Entities

// sourcery: AutoMockable
public protocol MyCoinsUseCaseProtocol {

    // TODO: Update when implement
    func execute() async throws -> [Coin]
}
