//
//  MockMarketData.swift
//  Domain
//
//  Created by Khanh on 28/12/2022.
//

import Entities

public struct MockMarketData: MarketData, Equatable {

    public let currentPrice: USDDecimalable
    public let priceChangePercentage24H: Double
    public let marketCap: USDDecimalable
    public let marketCapChangePercentage24H: Double
    public let ath: USDDecimalable
    public let athChangePercentage: USDDoublable
    public let atl: USDDecimalable
    public let atlChangePercentage: USDDoublable
    
    public static func == (lhs: MockMarketData, rhs: MockMarketData) -> Bool {
        lhs.currentPrice.usd == rhs.currentPrice.usd
    }
}
