//
//  APICoinDetail.swift
//
//  Created by Khanh on 28/12/2022.
//

import Entities
import Foundation

public struct APICoinDetail: CoinDetail, Decodable, Equatable {

    public let apiImage: APIImage
    public let apiMarketData: APIMarketData
    public var image: Image { apiImage }
    public var marketData: MarketData { apiMarketData}
    public let id: String
    public let symbol: String
    public let name: String
}

extension APICoinDetail {
    
    enum CodingKeys: String, CodingKey {
        
        case id, symbol, name
        case apiImage = "image"
        case apiMarketData = "marketData"
    }
}
