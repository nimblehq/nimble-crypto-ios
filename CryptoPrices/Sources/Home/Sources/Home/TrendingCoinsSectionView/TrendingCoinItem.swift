//
//  TrendingCoinItem.swift
//  Home
//
//  Created by Minh Pham on 29/12/2022.
//

import DomainTestHelpers
import Entities
import Foundation

public struct TrendingCoinItem: Identifiable, Equatable {
    
    public let id: String
    public let symbol: String
    public let name: String
    public let iconUrl: URL
    public let priceChangePercentage: Double
    public let isPriceUp: Bool
    
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
    
    static let mock = TrendingCoinItem(coin: MockCoin.single)
}
#endif
