//
//  FormatStyle+Extensions.swift
//  Styleguide
//
//  Created by Doan Thieu on 16/12/2022.
//

import Foundation

public extension FormatStyle where Self == DollarCurrencyFormatStyle {

    static var dollarCurrency: DollarCurrencyFormatStyle { .init() }
}

public extension FormatStyle where Self == PercentageFormatStyle {

    static var percentage: PercentageFormatStyle { .init() }
}
