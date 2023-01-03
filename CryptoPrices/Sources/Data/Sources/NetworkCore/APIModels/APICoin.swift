//
//  APICoin.swift
//  Data
//
//  Created by Doan Thieu on 01/12/2022.
//

import Foundation

public struct APICoin: Decodable, Equatable {

    public let id: String
    public let symbol: String
    public let name: String
    public let image: URL
    public let currentPrice: Decimal
    public let marketCap: Decimal
    public let priceChangePercentage24H: Double
    public let marketCapChangePercentage24H: Double
}
