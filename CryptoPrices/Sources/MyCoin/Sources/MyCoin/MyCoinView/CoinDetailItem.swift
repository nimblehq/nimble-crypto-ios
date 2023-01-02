//
//  CoinDetailItem.swift
//  MyCoin
//
//  Created by Khanh on 02/01/2023.
//

import DomainTestHelpers
import Entities
import Foundation

public struct CoinDetailItem: Identifiable, Equatable {

    public let id: String
    public let symbol: String
    public let name: String
    public let imageURL: URL
    public let currentPrice: Decimal
    public let priceChangePercentage24H: Double
    public let marketCap: Decimal
    public let marketCapChangePercentage24H: Double
    public let ath: Decimal
    public let athChangePercentage: Double
    public let atl: Decimal
    public let atlChangePercentage: Double

    // swiftlint:disable force_unwrapping
    public init(coinDetail: CoinDetail) {
        let marketData = coinDetail.marketData
        self.id = coinDetail.id
        self.symbol = coinDetail.symbol.uppercased()
        self.name = coinDetail.name
        self.currentPrice = marketData.currentPrice.usd
        self.imageURL = URL(string: coinDetail.image.large)!
        self.priceChangePercentage24H = marketData.priceChangePercentage24H
        self.marketCap = marketData.marketCap.usd
        self.marketCapChangePercentage24H = marketData.marketCapChangePercentage24H
        self.ath = marketData.ath.usd
        self.athChangePercentage = marketData.athChangePercentage.usd
        self.atl = marketData.atl.usd
        self.atlChangePercentage = marketData.atlChangePercentage.usd
    }
}

#if DEBUG
extension CoinDetailItem {

    static let mock = CoinDetailItem(coinDetail: MockCoinDetail.single)
}
#endif
