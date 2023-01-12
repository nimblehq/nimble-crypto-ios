//
//  ChartDataPointUIModel.swift
//  MyCoin
//
//  Created by Minh Pham on 10/01/2023.
//

import Entities
import Charts
import Foundation

public struct ChartDataPointUIModel: Equatable {

    public let price: Decimal
    public let timestamp: TimeInterval

    public init(dataPoint: ChartDataPoint) {
        self.price = dataPoint.price
        self.timestamp = dataPoint.timestamp
    }

    public func toChartDataEntry() -> ChartDataEntry {
        let priceInDouble = NSDecimalNumber(decimal: price).doubleValue
        return ChartDataEntry(x: timestamp, y: priceInDouble)
    }
}
