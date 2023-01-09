//
//  TimeFrameItem.swift
//  MyCoin
//
//  Created by Khanh on 04/01/2023.
//

import DomainTestHelpers
import Entities
import Foundation

struct TimeFrameItem: Identifiable, Equatable {

    let id = UUID()
    let timeFrame: TimeFilter
    var title: String {
        switch timeFrame {
        case .oneDay: return Strings.MyCoin.TimeFrame.oneDayText
        case .oneWeek: return Strings.MyCoin.TimeFrame.oneWeekText
        case .oneMonth: return Strings.MyCoin.TimeFrame.oneMonthText
        case .oneYear: return Strings.MyCoin.TimeFrame.oneYearText
        case .fiveYears: return Strings.MyCoin.TimeFrame.fiveYearText
        }
    }

    static func == (lhs: TimeFrameItem, rhs: TimeFrameItem) -> Bool {
        lhs.timeFrame == rhs.timeFrame
    }
}
