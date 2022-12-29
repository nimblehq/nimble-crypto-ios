//
//  MockMarketData.swift
//
//  Created by Khanh on 28/12/2022.
//

import Entities

public struct MockMarketData: MarketData, Equatable {

    public let currentPrice: CurrentPrice
    public let priceChangePercentage24H: Double
    public let marketCap: MarketCap
    public let marketCapChangePercentage24H: Double
    public let ath: Ath
    public let athChangePercentage: AthChangePercentage
    public let atl: Atl
    public let atlChangePercentage: AtlChangePercentage
    
    public static func == (lhs: MockMarketData, rhs: MockMarketData) -> Bool {
        lhs.currentPrice.usd == rhs.currentPrice.usd
    }
}
