// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Home {
    internal enum MyCoin {
      /// My Coins 😎
      internal static let title = Strings.tr("Localizable", "home.myCoin.title", fallback: "My Coins 😎")
    }
    internal enum SeeAll {
      /// see all ->
      internal static let text = Strings.tr("Localizable", "home.seeAll.text", fallback: "see all ->")
    }
    internal enum Title {
      /// Localizable.strings
      ///   CryptoPrices
      /// 
      ///   Created by Mike Pham on 06/12/2022.
      internal static let text = Strings.tr("Localizable", "home.title.text", fallback: "Trade Now and Get\nYour Life")
    }
    internal enum TodayProfit {
      /// Today’s Profit
      internal static let title = Strings.tr("Localizable", "home.todayProfit.title", fallback: "Today’s Profit")
    }
    internal enum TotalCoins {
      /// Total Coins
      internal static let title = Strings.tr("Localizable", "home.totalCoins.title", fallback: "Total Coins")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
