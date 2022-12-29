//
//  APIMarketCap.swift
//
//  Created by Khanh on 28/12/2022.
//

import Foundation
import Entities

public struct APIMarketCap: MarketCap, Decodable, Equatable {

    public let usd: Decimal
}
