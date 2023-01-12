//
//  DollarCurrencyFormatStyle.swift
//  Styleguide
//
//  Created by Doan Thieu on 15/12/2022.
//

import Foundation

// We want the "$" sign always prefix the amount (e.g "$ 1,200"),
// so we can't use built-in Decimal.FormatStyle.Currency
public struct DollarCurrencyFormatStyle: FormatStyle {

    public func format(_ value: Decimal) -> String {
        return "$\(value.formatted(.number.precision(.fractionLength(0...2))))"
    }
}
