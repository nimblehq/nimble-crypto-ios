//
//  CoinDetail.swift
//  Domain
//
//  Created by Khanh on 28/12/2022.
//

public protocol CoinDetail {

    var id: String { get }
    var symbol: String { get }
    var name: String { get }
    var image: Image { get }
    var marketData: MarketData { get }
}
