//
//  Coin.swift
//  Domain
//
//  Created by Doan Thieu on 01/12/2022.
//

import Foundation

// sourcery: AutoMockable
public protocol Coin {

    var id: String { get }
    var symbol: String { get }
    var name: String { get }
    var image: URL { get }
    var currentPrice: Decimal { get }
    var marketCap: Decimal { get }
    var priceChangePercentage24H: Double { get }
    var marketCapChangePercentage24H: Double { get }
}
