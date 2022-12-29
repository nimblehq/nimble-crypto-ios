//
//  APICurrentPrice.swift
//
//  Created by Khanh on 28/12/2022.
//

import Foundation
import Entities

public struct APICurrentPrice: CurrentPrice, Decodable, Equatable {

    public let usd: Decimal
}
