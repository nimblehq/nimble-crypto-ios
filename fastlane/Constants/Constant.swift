//
//  Constant.swift
//  FastlaneRunner
//
//  Created by Mike Pham on 29/11/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Foundation

enum Constant {

    // MARK: - Firebase

    static let stagingFirebaseAppId = "1:169659422201:ios:15bd8fa2f4f5b9f86cd928"
    static let productionFirebaseAppId = "1:814505320278:ios:e4bbd77204f7bed25800f7"
    static let firebaseTesterGroups = "Nimble"

    // MARK: - Match

    static let userName = "minh@nimblehq.co"
    static let teamId = "4TWS7E2EPE"
    static let keychainName = "app-signing.keychain-db"
    static let matchURL = "git@github.com:nimblehq/match-certificates.git"

    // MARK: - Path

    static let outputPath = "./Output"
    static let buildPath = "\(outputPath)/Build"
    static let derivedDataPath = "\(outputPath)/DerivedData"
    static let projectPath: String = "./\(projectName).xcodeproj"
    static let testOutputDirectoryPath = "./fastlane/test_output"

    // MARK: Platform

    static var platform: PlatformType {
        .gitHubActions
    }

    // MARK: - Project

    static let stagingBundleId = "co.nimblehq.crypto-prices.staging"
    static let productionBundleId = "co.nimblehq.crypto-prices"
    static let projectName = "CryptoPrices"
    
    // MARK: - Build and Version

    static let manualVersion: String = ""

    // MARK: - Device

    static let devices = ["iPhone 13 Pro"]
    
    // MARK: - Test

    static let testTarget: String = "\(projectName)Tests"
    static let uiTestTarget: String = "\(projectName)UITests"
}

extension Constant {

    enum Environment: String {

        case staging = "Staging"
        case production = ""

        var productName: String { "\(Constant.projectName) \(rawValue)".trimmed }

        var scheme: String { "\(Constant.projectName) \(rawValue)".trimmed }

        var bundleId: String {
            switch self {
            case .staging: return Constant.stagingBundleId
            case .production: return Constant.productionBundleId
            }
        }

        var firebaseAppId: String {
            switch self {
            case .staging: return Constant.stagingFirebaseAppId
            case .production: return Constant.productionFirebaseAppId
            }
        }

        var gspPath: String {
            let infoName = "GoogleService-Info.plist"
            let googleServiceFolder = "./\(Constant.projectName)/Configurations/Plists/GoogleService"
            switch self {
            case .staging: return "\(googleServiceFolder)/Staging/\(infoName)"
            case .production: return "\(googleServiceFolder)/Production/\(infoName)"
            }
        }
    }

    enum BuildType: String {

        case adHoc = "ad-hoc"
        case appStore = "app-store"

        var value: String { return rawValue }

        var method: String {
            switch self {
            case .adHoc: return "AdHoc"
            case .appStore: return "AppStore"
            }
        }
    }

    enum PlatformType {

        case gitHubActions, bitrise, unknown
    }
}

extension String {

    fileprivate var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
}
