//
//  DataPoint.swift
//  Data
//
//  Created by Minh Pham on 27/12/2022.
//

import Foundation

public struct DataPoint: Equatable {

    public let timestamp: TimeInterval
    public let price: Decimal

    public init(timestamp: TimeInterval, price: Decimal) {
        self.timestamp = timestamp
        self.price = price
    }
}
