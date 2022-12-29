//
//  APIMarketData.swift
//
//  Created by Khanh on 28/12/2022.
//

import Entities
import Foundation

public struct APIMarketData: MarketData, Decodable, Equatable {
    
    public var apiCurrentPrice: APICurrentPrice
    public var apiMarketCap: APIMarketCap
    public var apiAth: APIAth
    public var apiAthChangePercentage: APIAthChangePercentage
    public var apiAtl: APIAtl
    public var apiAtlChangePercentage: APIAtlChangePercentage
    
    public var currentPrice: CurrentPrice { apiCurrentPrice }
    public var marketCap: MarketCap { apiMarketCap }
    public var ath: Ath { apiAth }
    public var athChangePercentage: AthChangePercentage { apiAthChangePercentage }
    public var atl: Atl { apiAtl }
    public var atlChangePercentage: AtlChangePercentage { apiAtlChangePercentage }
    
    public let priceChangePercentage24H: Double
    public let marketCapChangePercentage24H: Double

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
