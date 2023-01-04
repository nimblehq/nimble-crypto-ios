//
//  TimeFrameItem.swift
//  MyCoin
//
//  Created by Khanh on 04/01/2023.
//

import DomainTestHelpers
import Entities
import Foundation

public struct TimeFrameItem: Identifiable, Equatable {

    public let id = UUID()
    public let timeFrame: TimeFilter
    public var title: String {
        switch timeFrame {
        // TODO: - Localize texts after closing https://github.com/nimblehq/nimble-crypto-ios/pull/80
        case .oneDay: return "1D"
        case .oneWeek: return "1W"
        case .oneMonth: return "1M"
        case .oneYear: return "1Y"
        case .fiveYears: return "5Y"
        }
    }

    public static func == (lhs: TimeFrameItem, rhs: TimeFrameItem) -> Bool {
        lhs.timeFrame == rhs.timeFrame
    }
}
