//
//  MockCoinDetail.swift
//
//  Created by Khanh on 28/12/2022.
//

import Entities
import Foundation

public struct MockCoinDetail: CoinDetail, Equatable {

    public let id: String
    public let symbol: String
    public let name: String
    public let image: Image
    public let marketData: MarketData

    public static func == (lhs: MockCoinDetail, rhs: MockCoinDetail) -> Bool {
        lhs.id == rhs.id
    }
}

public extension MockCoinDetail {

    static var single = MockCoinDetail(
        id: "mockID",
        symbol: "mockSymbol",
        name: "MockCoin",
        image: MockImage(large: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"),
        marketData: MockMarketData(
            currentPrice: MockCurrentPrice(usd: 12.34),
            priceChangePercentage24H: 2.3,
            marketCap: MockMarketCap(usd: 567.89),
            marketCapChangePercentage24H: -2.1,
            ath: MockAth(usd: 123_567.89),
            athChangePercentage: MockAthChangePercentage(usd: 1_000.0),
            atl: MockAtl(usd: 1.0),
            atlChangePercentage: MockAtlChangePercentage(usd: 0.01)
        )
    )
}
