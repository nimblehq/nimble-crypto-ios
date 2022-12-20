//
//  MyCoinItem.swift
//  Home
//
//  Created by Doan Thieu on 14/12/2022.
//

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

    init(
        id: String,
        symbol: String,
        name: String,
        iconUrl: URL,
        currentPrice: Decimal,
        priceChangePercentage: Double,
        isPriceUp: Bool
    ) {
        self.id = id
        self.symbol = symbol.uppercased()
        self.name = name
        self.iconUrl = iconUrl
        self.currentPrice = currentPrice
        self.priceChangePercentage = priceChangePercentage
        self.isPriceUp = isPriceUp
   }

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

    // swiftlint:disable force_unwrapping
    static let mock = MyCoinItem(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        iconUrl: URL(string: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")!,
        currentPrice: 17_279.09,
        priceChangePercentage: 2.44,
        isPriceUp: false
    )
}
#endif
