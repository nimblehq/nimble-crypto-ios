//
//  PrimaryButtonStyle.swift
//  Styleguide
//
//  Created by Doan Thieu on 10/01/2023.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {

    private static let backgroundColor = Colors.guppieGreen.swiftUIColor
    private static let selectedBackgroundColor = Colors.guppieGreen.swiftUIColor.opacity(0.5)

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(Fonts.Inter.medium.textStyle(.body))
            .frame(height: 48.0)
            .background(
                configuration.isPressed ? Self.selectedBackgroundColor : Self.backgroundColor
            )
            .cornerRadius(12.0)
            .foregroundColor(.white)
    }
}
