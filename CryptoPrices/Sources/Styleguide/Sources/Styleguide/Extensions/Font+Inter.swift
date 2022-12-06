//
//  Font+Inter.swift
//  Styleguide
//
//  Created by Minh Pham on 06/12/2022.
//

import SwiftUI
import Foundation

public extension Font {
    
    enum Inter: CaseIterable {

        case regular
        case bold

        public func font(for style: UIFont.TextStyle) -> Font {
            let fontSize = fontSize(style: style)
            let finalFont = Font.custom(fontName(), fixedSize: fontSize)
            return finalFont
        }

        public static func registerFonts() {
            Inter.allCases.forEach {
                registerFont(bundle: .module, fontName: $0.fontName(), fontExtension: "ttf")
            }
        }

        func fontName() -> String {
            switch self {
            case .regular: return "Inter-Regular"
            case .bold: return "Inter-Bold"
            }
        }

        // swiftlint:disable:next cyclomatic_complexity
        func fontSize(style: UIFont.TextStyle) -> CGFloat {
            switch style {
            case .largeTitle: return 34.0
            case .title1: return 28.0
            case .title2: return 24.0
            case .title3: return 20.0
            case .headline: return 18.0
            case .body: return 17.0
            case .callout: return 16.0
            case .subheadline: return 15.0
            case .footnote: return 13.0
            case .caption1: return 12.0
            case .caption2: return 11.0
            default: return 17.0
            }
        }

        static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
            guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
                let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
                let font = CGFont(fontDataProvider) else {
                    fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
            }

            var error: Unmanaged<CFError>?

            CTFontManagerRegisterGraphicsFont(font, &error)
        }
    }
}
