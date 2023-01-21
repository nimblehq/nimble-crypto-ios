// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuildTools",
    products: [
        .plugin(
            name: "SourceryPlugin",
            targets: ["SourceryPlugin"]
        ),
        .plugin(
            name: "SwiftLintPlugin",
            targets: ["SwiftLintPlugin"]
        )
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "SourceryPlugin",
            capability: .buildTool(),
            dependencies: [
                .target(name: "Sourcery")
            ]
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: [
                .target(name: "SwiftLintBinary")
            ]
        ),
        .binaryTarget(
            name: "Sourcery",
            path: "Binaries/Sourcery.artifactbundle"
        ),
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.50.3/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "abe7c0bb505d26c232b565c3b1b4a01a8d1a38d86846e788c4d02f0b1042a904"
        )
    ]
)
