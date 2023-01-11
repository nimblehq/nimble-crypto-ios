//
//  MockCoinDetail.swift
//  Domain
//
//  Created by Khanh on 28/12/2022.
//

import Entities

public struct MockCoinDetail: CoinDetail, Equatable {

    public let id: String
    public let symbol: String
    public let name: String
    public let image: Image
    public let marketData: MarketData

    public static func == (lhs: MockCoinDetail, rhs: MockCoinDetail) -> Bool {
        lhs.id == rhs.id &&
        MockMarketData(marketData: lhs.marketData) == MockMarketData(marketData: rhs.marketData)
    }
}

public extension MockCoinDetail {

    static var single = MockCoinDetail(
        id: "mockID",
        symbol: "mockSymbol",
        name: "MockCoin",
        image: MockImage(large: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"),
        marketData: MockMarketData(
            currentPrice: MockUSDDecimal(usd: 12.34),
            priceChangePercentage24H: 2.3,
            marketCap: MockUSDDecimal(usd: 567.89),
            marketCapChangePercentage24H: -2.1,
            ath: MockUSDDecimal(usd: 123_567.89),
            athChangePercentage: MockUSDDouble(usd: 1_000.0),
            atl: MockUSDDecimal(usd: 1.0),
            atlChangePercentage: MockUSDDouble(usd: 0.01)
        )
    )
}
