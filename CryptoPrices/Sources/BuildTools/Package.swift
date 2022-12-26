// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuildTools",
    products: [
        .plugin(
            name: "SourceryPlugin",
            targets: ["SourceryPlugin"]
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
        .binaryTarget(
            name: "Sourcery",
            path: "Binaries/Sourcery.artifactbundle"
        )
    ]
)
