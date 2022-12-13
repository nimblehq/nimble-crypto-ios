//
//  FontConvertible+TextStyle.swift
//  Styleguide
//
//  Created by Minh Pham on 06/12/2022.
//

// Reference: https://www.kodeco.com/23709326-swiftgen-tutorial-for-ios#toc-anchor-011

import SwiftUI

extension FontConvertible {

    public func textStyle(_ textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
        SwiftUI.Font.mappedFont(name, textStyle: textStyle)
    }
}

fileprivate extension SwiftUI.Font {

    static func mappedFont(_ name: String, textStyle: TextStyle) -> SwiftUI.Font {
        let fontStyle = mapToUIFontTextStyle(textStyle)
        let fontSize = UIFont.preferredFont(forTextStyle: fontStyle).pointSize
        return SwiftUI.Font.custom(name, size: fontSize, relativeTo: textStyle)
    }

    // swiftlint:disable:next cyclomatic_complexity
    static func mapToUIFontTextStyle(
        _ textStyle: SwiftUI.Font.TextStyle
    ) -> UIFont.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title1
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .callout:
            return .callout
        case .body:
            return .body
        case .caption:
            return .caption1
        case .caption2:
            return .caption2
        case .footnote:
            return .footnote
        @unknown default:
            fatalError("Missing a TextStyle mapping")
        }
    }
}
