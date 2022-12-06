//
//  Color+Extensions.swift
//  Styleguide
//
//  Created by Minh Pham on 06/12/2022.
//

import SwiftUI

public extension Color {

    /// #028090
    static var metallicSeaweed: Color { Color(hex: 0x028090) }

    /// #00BFB2
    static var tiffanyBlue: Color { Color(hex: 0x00BFB2) }

    /// #10DC78
    static var guppieGreen: Color { Color(hex: 0x10DC78) }

    /// #D6D7D8
    static var lightSilver: Color { Color(hex: 0xD6D7D8) }

    /// #D6F5F3
    static var water: Color { Color(hex: 0xD6F5F3) }

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
