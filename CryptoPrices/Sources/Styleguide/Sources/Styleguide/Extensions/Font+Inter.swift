//
//  Font+Inter.swift
//  Styleguide
//
//  Created by Minh Pham on 06/12/2022.
//

import SwiftUI

public extension Font {
    
    enum Inter: CaseIterable {

        case regular
        case medium
        case bold

        public func font(for style: Font.TextStyle) -> Font {
            let fontSize = fontSize(style: style)
            let finalFont = Font.custom(fontName(), fixedSize: fontSize)
            return finalFont
        }

        public static func registerFonts() {
            Inter.allCases.forEach {
                registerFont(bundle: .module, fontName: $0.fontName(), fontExtension: "ttf")
            }
        }

        private func fontName() -> String {
            switch self {
            case .regular: return "Inter-Regular" // Weight: 400
            case .medium: return "Inter-Medium" // Weight: 500
            case .bold: return "Inter-Bold" // Weight: 700
            }
        }

        private func fontSize(style: Font.TextStyle) -> CGFloat {
            switch style {
            case .largeTitle: return 30.0
            case .title2: return 24.0
            case .title3: return 20.0
            case .headline: return 18.0
            case .body: return 17.0
            case .callout: return 16.0
            case .subheadline: return 15.0
            case .footnote: return 13.0
            case .caption2: return 12.0
            default: return 17.0
            }
        }

        private static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
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
