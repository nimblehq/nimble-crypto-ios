//  Preview.swift
//  Home
//
//  Created by Doan Thieu on 04/12/2022.
//

// swiftlint:disable type_contents_order

import SwiftUI

public struct Preview<Content: View>: View {

    let content: Content

    public init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        Group {
            content
                .environment(\.colorScheme, .light)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 14 Pro")
                .previewDisplayName("Pro - Light mode")

            content
                .environment(\.colorScheme, .dark)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 14 Pro")
                .previewDisplayName("Pro - Dark mode")
        }
    }
}
