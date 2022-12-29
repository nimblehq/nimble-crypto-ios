//
//  APIMarketData.swift
//
//  Created by Khanh on 28/12/2022.
//

import Entities
import Foundation

public struct APIMarketData: MarketData, Decodable, Equatable {
    
    public let apiCurrentPrice: APIUSDDecimal
    public let apiMarketCap: APIUSDDecimal
    public let apiAth: APIUSDDecimal
    public let apiAthChangePercentage: APIUSDDouble
    public let apiAtl: APIUSDDecimal
    public let apiAtlChangePercentage: APIUSDDouble
    public let priceChangePercentage24H: Double
    public let marketCapChangePercentage24H: Double
    public var currentPrice: USDDecimalable { apiCurrentPrice }
    public var marketCap: USDDecimalable { apiMarketCap }
    public var ath: USDDecimalable { apiAth }
    public var athChangePercentage: USDDoublable { apiAthChangePercentage }
    public var atl: USDDecimalable { apiAtl }
    public var atlChangePercentage: USDDoublable { apiAtlChangePercentage }
}

extension APIMarketData {
    
    enum CodingKeys: String, CodingKey {
        
        case priceChangePercentage24H, marketCapChangePercentage24H
        case apiCurrentPrice = "currentPrice"
        case apiMarketCap = "marketCap"
        case apiAth = "ath"
        case apiAthChangePercentage = "athChangePercentage"
        case apiAtl = "atl"
        case apiAtlChangePercentage = "atlChangePercentage"
    }
}
