//
//  MyCoinsParameters.swift
//  Data
//
//  Created by Doan Thieu on 09/12/2022.
//

public struct MyCoinsParameters: Parameterable {

    public let vsCurrency = "usd"
    public let perPage: Int
    public let page: Int
    public let order = "market_cap_desc"
    public let priceChangePercentage = "24h"
}
