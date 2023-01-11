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

    public init(marketData: MarketData) {
        self.currentPrice = marketData.currentPrice
        self.priceChangePercentage24H = marketData.priceChangePercentage24H
        self.marketCap = marketData.marketCap
        self.marketCapChangePercentage24H = marketData.marketCapChangePercentage24H
        self.ath = marketData.ath
        self.athChangePercentage = marketData.athChangePercentage
        self.atl = marketData.atl
        self.atlChangePercentage = marketData.atlChangePercentage
    }

    public init(
        currentPrice: USDDecimalable,
        priceChangePercentage24H: Double,
        marketCap: USDDecimalable,
        marketCapChangePercentage24H: Double,
        ath: USDDecimalable,
        athChangePercentage: USDDoublable,
        atl: USDDecimalable,
        atlChangePercentage: USDDoublable
    ) {
        self.currentPrice = currentPrice
        self.priceChangePercentage24H = priceChangePercentage24H
        self.marketCap = marketCap
        self.marketCapChangePercentage24H = marketCapChangePercentage24H
        self.ath = ath
        self.athChangePercentage = athChangePercentage
        self.atl = atl
        self.atlChangePercentage = atlChangePercentage
    }

    public static func == (lhs: MockMarketData, rhs: MockMarketData) -> Bool {
        lhs.currentPrice.usd == rhs.currentPrice.usd &&
        lhs.priceChangePercentage24H == rhs.priceChangePercentage24H &&
        lhs.marketCap.usd == rhs.marketCap.usd &&
        lhs.marketCapChangePercentage24H == rhs.marketCapChangePercentage24H &&
        lhs.ath.usd == rhs.ath.usd &&
        lhs.athChangePercentage.usd == rhs.athChangePercentage.usd &&
        lhs.atl.usd == rhs.atl.usd &&
        lhs.atlChangePercentage.usd == rhs.atlChangePercentage.usd
    }
}
