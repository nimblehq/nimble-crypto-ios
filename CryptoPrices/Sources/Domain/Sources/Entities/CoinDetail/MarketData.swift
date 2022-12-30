//
//  MarketData.swift
//  Domain
//
//  Created by Khanh on 28/12/2022.
//

public protocol MarketData {

    var currentPrice: USDDecimalable { get }
    var priceChangePercentage24H: Double { get }
    var marketCap: USDDecimalable { get }
    var marketCapChangePercentage24H: Double { get }
    var ath: USDDecimalable { get }
    var athChangePercentage: USDDoublable { get }
    var atl: USDDecimalable { get }
    var atlChangePercentage: USDDoublable { get }
}
