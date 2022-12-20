//
//  TrendingCoinsParameters.swift
//  Data
//
//  Created by Minh Pham on 16/12/2022.
//

public struct TrendingCoinsParameters: Parameterable {

    public let ids: String
    public let vsCurrency = "usd"
    public let perPage: Int
    public let page: Int
    public let order = "market_cap_desc"
    public let priceChangePercentage = "24h"
}
