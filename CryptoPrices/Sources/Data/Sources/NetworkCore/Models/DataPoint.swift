//
//  DataPoint.swift
//  Data
//
//  Created by Minh Pham on 27/12/2022.
//

import Foundation

public struct DataPoint {

    public let timestamp: TimeInterval
    public let price: Double

    public init(timestamp: TimeInterval, price: Double) {
        self.timestamp = timestamp
        self.price = price
    }
}
