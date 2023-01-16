//
//  PercentageView.swift
//  Styleguide
//
//  Created by Doan Thieu on 11/01/2023.
//

import SwiftUI

public struct PercentageView: View {

    private let value: Double

    public var body: some View {
        HStack {
            value > 0.0
            ? Images.icArrowUpGreen.swiftUIImage
            : Images.icArrowDownRed.swiftUIImage

            Text(value, format: .percentage)
                .foregroundColor(
                    value > 0.0
                    ? Colors.guppieGreen.swiftUIColor
                    : Colors.carnation.swiftUIColor
                )
        }
    }

    public init(_ value: Double) {
        self.value = value
    }
}
