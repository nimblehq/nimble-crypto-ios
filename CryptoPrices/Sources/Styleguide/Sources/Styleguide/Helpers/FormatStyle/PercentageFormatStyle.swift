//
//  PercentageFormatStyle.swift
//  Styleguide
//
//  Created by Doan Thieu on 16/12/2022.
//

import Foundation

// The built-in `FloatingPointFormatStyle<Double>.Percent` divides
// the given value to 100 and display the minus sign when it is negative.
public struct PercentageFormatStyle: FormatStyle {

    public func format(_ value: Double) -> String {
        return "\(abs(value).formatted(.number.precision(.fractionLength(2))))%"
    }
}
