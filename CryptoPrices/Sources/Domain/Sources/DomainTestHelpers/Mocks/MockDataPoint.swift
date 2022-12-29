//
//  MockDataPoint.swift
//  Domain
//
//  Created by Minh Pham on 27/12/2022.
//
// swiftlint:disable number_separator

import Entities
import Foundation

public struct MockDataPoint: ChartDataPoint, Equatable {

    public var timestamp: TimeInterval
    public var price: Decimal
}

public extension MockDataPoint {

    static let single = MockDataPoint(
        timestamp: 1640995200000,
        price: 46319.65108805251
    )

    static let array = [
        MockDataPoint(
            timestamp: 1640649600000,
            price: 50774.067814743
        ),
        MockDataPoint(
            timestamp: 1640736000000,
            price: 47725.14804631933
        ),
        MockDataPoint(
            timestamp: 1640822400000,
            price: 46506.99464767938
        ),
        MockDataPoint(
            timestamp: 1640908800000,
            price: 47191.86838983951
        ),
        MockDataPoint(
            timestamp: 1640995200000,
            price: 46319.65108805251
        ),
        MockDataPoint(
            timestamp: 1641081600000,
            price: 47816.07767640849
        ),
        MockDataPoint(
            timestamp: 1641168000000,
            price: 47387.212167697246
        ),
        MockDataPoint(
            timestamp: 1641254400000,
            price: 46531.140860530526
        ),
        MockDataPoint(
            timestamp: 1641340800000,
            price: 45938.02427172366
        ),
        MockDataPoint(
            timestamp: 1641427200000,
            price: 43647.147508068054
        )
    ]
}
