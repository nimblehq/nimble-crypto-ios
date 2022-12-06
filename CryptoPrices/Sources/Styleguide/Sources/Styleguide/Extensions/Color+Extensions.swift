//
//  File.swift
//  Styleguide
//
//  Created by Minh Pham on 06/12/2022.
//

import SwiftUI

public extension Color {

    /// #028090
    static var startGradientJade: Color { Color(hex: 0x028090) }

    /// #00BFB2
    static var endGradientJade: Color { Color(hex: 0x00BFB2) }

    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }

}
