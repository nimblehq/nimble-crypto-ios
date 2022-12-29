//
//  TrendingCoinItem.swift
//  Home
//
//  Created by Minh Pham on 29/12/2022.
//

import Entities
import Foundation

public struct TrendingCoinItem: Identifiable, Equatable {
    
    public let id: String
    public let symbol: String
    public let name: String
    public let iconUrl: URL
    public let priceChangePercentage: Double
    public let isPriceUp: Bool
    
    init(
        id: String,
        symbol: String,
        name: String,
        iconUrl: URL,
        priceChangePercentage: Double,
        isPriceUp: Bool
    ) {
        self.id = id
        self.symbol = symbol.uppercased()
        self.name = name
        self.iconUrl = iconUrl
        self.priceChangePercentage = priceChangePercentage
        self.isPriceUp = isPriceUp
    }
    
    public init(coin: Coin) {
        id = coin.id
        symbol = coin.symbol.uppercased()
        name = coin.name
        iconUrl = coin.image
        priceChangePercentage = coin.priceChangePercentage24H
        isPriceUp = coin.priceChangePercentage24H > 0.0
    }
}

#if DEBUG
extension TrendingCoinItem {
    
    // swiftlint:disable force_unwrapping
    static let mock = TrendingCoinItem(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        iconUrl: URL(string: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")!,
        priceChangePercentage: 2.44,
        isPriceUp: false
    )
}
#endif
