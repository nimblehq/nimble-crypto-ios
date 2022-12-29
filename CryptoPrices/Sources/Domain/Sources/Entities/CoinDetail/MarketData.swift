//
//  MarketData.swift
//
//  Created by Khanh on 28/12/2022.
//

// sourcery: AutoMockable
public protocol MarketData {

    var currentPrice: CurrentPrice { get }
    var priceChangePercentage24H: Double { get }
    var marketCap: MarketCap { get }
    var marketCapChangePercentage24H: Double { get }
    var ath: Ath { get }
    var athChangePercentage: AthChangePercentage { get }
    var atl: Atl { get }
    var atlChangePercentage: AtlChangePercentage { get }
}
