//
//  APIPrices+DataPoint.swift
//  Data
//
//  Created by Minh Pham on 29/12/2022.
//

import Foundation

public extension APIPrices {

    func toDataPoints() -> [DataPoint] {
        let dataPoints = prices.map {
            let timestamp = NSDecimalNumber(decimal: $0.first ?? 0.0).doubleValue
            let price = $0.last ?? 0.0
            return DataPoint(timestamp: timestamp, price: price)
        }
        return dataPoints
    }
}
