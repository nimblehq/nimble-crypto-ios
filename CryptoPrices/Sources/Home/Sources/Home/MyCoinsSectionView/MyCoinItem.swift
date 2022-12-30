//
//  MyCoinItem.swift
//  Home
//
//  Created by Doan Thieu on 14/12/2022.
//

import DomainTestHelpers
import Entities
import Foundation

public struct MyCoinItem: Identifiable, Equatable {

    public let id: String
    public let symbol: String
    public let name: String
    public let iconUrl: URL
    public let currentPrice: Decimal
    public let priceChangePercentage: Double
    public let isPriceUp: Bool

    public init(coin: Coin) {
        self.id = coin.id
        self.symbol = coin.symbol.uppercased()
        self.name = coin.name
        self.iconUrl = coin.image
        self.currentPrice = coin.currentPrice
        self.priceChangePercentage = coin.priceChangePercentage24H
        self.isPriceUp = coin.priceChangePercentage24H > 0.0
    }
}

#if DEBUG
extension MyCoinItem {

    static let mock = MyCoinItem(coin: MockCoin.single)
}
#endif
