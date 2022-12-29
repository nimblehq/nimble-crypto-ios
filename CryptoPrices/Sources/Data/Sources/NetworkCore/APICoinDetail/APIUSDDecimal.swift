//
//  APIUSDDecimal.swift
//
//  Created by Khanh on 29/12/2022.
//

import Entities
import Foundation

public struct APIUSDDecimal: USDDecimalable, Decodable, Equatable {

    public let usd: Decimal
}
