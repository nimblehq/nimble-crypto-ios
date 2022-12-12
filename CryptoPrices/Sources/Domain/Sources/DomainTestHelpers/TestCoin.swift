//
//  TestCoin.swift
//  Domain
//
//  Created by Doan Thieu on 12/12/2022.
//

import Entities
import Foundation

public struct TestCoin: Coin, Equatable {

    public var id: String
    public var name: String
    public var image: URL
    public var currentPrice: Decimal
    public var marketCap: Decimal
    public var priceChangePercentage24H: Double
    public var marketCapChangePercentage24H: Double
}

public extension TestCoin {

    // swiftlint:disable force_unwrapping
    static var single = TestCoin(
        id: "testcoin",
        name: "TestCoin",
        image: URL(string: "/")!,
        currentPrice: 12.34,
        marketCap: 567.89,
        priceChangePercentage24H: 2.34,
        marketCapChangePercentage24H: 3.45
    )
}
