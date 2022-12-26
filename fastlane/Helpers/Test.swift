//
//  Test.swift
//  FastlaneRunner
//
//  Created by Khanh on 01/12/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

enum Test {

    static func buildAndTest(
        environment: Constant.Environment,
        targets: [String],
        devices: [String]
    ) {
        scan(
            scheme: .userDefined(environment.scheme),
            devices: .userDefined(devices),
            onlyTesting: targets,
            codeCoverage: .userDefined(true),
            outputDirectory: Constant.testOutputDirectoryPath,
            xcodebuildFormatter: "xcbeautify",
            resultBundle: .userDefined(true),
            clonedSourcePackagesPath: .userDefined("SourcePackages"),
//            skipPackageDependenciesResolution: .userDefined(true),
            disablePackageAutomaticUpdates: .userDefined(true),
            failBuild: .userDefined(false)
        )
    }
}
