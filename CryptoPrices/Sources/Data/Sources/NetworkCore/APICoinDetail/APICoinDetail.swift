//
//  APICoinDetail.swift
//
//  Created by Khanh on 28/12/2022.
//

public struct APICoinDetail: Decodable, Equatable {

    public let apiImage: APIImage
    public let apiMarketData: APIMarketData
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
