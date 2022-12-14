//
//  ChartDataPoint.swift
//  Domain
//
//  Created by Minh Pham on 27/12/2022.
//

import Foundation

// sourcery: AutoMockable
public protocol ChartDataPoint {

    var price: Decimal { get }
    var timestamp: TimeInterval { get }
}
