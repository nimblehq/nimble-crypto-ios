//
//  APIPrices.swift
//  Data
//
//  Created by Minh Pham on 27/12/2022.
//

import Foundation

public struct APIPrices: Decodable, Equatable {

    public let prices: [[Decimal]]
}
