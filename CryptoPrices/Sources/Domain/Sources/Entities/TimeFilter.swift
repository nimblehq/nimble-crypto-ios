//
//  TimeFilter.swift
//  Domain
//
//  Created by Minh Pham on 27/12/2022.
//

public enum TimeFilter {

    case oneDay
    case oneWeek
    case oneMonth
    case oneYear
    case fiveYears

    public var daysCount: Int {
        switch self {
        case .oneDay: return 1
        case .oneWeek: return 7
        case .oneMonth: return 30
        case .oneYear: return 365
        case .fiveYears: return 1_285 // 365*5
        }
    }
}
