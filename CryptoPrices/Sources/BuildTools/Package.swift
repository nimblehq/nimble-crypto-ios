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
            name: "SwiftGenPlugin",
            targets: ["SwiftGenPlugin"]
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
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: [
                .target(name: "swiftgen")
            ]
        ),
        .binaryTarget(
            name: "Sourcery",
            path: "Binaries/Sourcery.artifactbundle"
        ),
        .binaryTarget(
            name: "swiftgen",
            url: "https://github.com/SwiftGen/SwiftGen/releases/download/6.6.2/swiftgen-6.6.2.artifactbundle.zip",
            checksum: "7586363e24edcf18c2da3ef90f379e9559c1453f48ef5e8fbc0b818fbbc3a045"
        )
    ]
)
