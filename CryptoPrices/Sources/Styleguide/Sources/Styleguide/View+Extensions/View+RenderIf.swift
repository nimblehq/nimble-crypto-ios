//
//  View+RenderIf.swift
//  Styleguide
//
//  Created by Doan Thieu on 05/01/2023.
//

import SwiftUI

private struct RenderIfModifier: ViewModifier {

    let condition: Bool

    init(_ condition: Bool) {
        self.condition = condition
    }

    func body(content: Content) -> some View {
        if condition {
            content
        }
    }
}

public extension View {

    func renderIf(_ condition: Bool) -> some View {
        modifier(RenderIfModifier(condition))
    }
}
