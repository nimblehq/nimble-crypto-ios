// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Styleguide",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Styleguide",
            targets: ["Styleguide"]
        )
    ],
    dependencies: [
        .package(name: "BuildTools", path: "../BuildTools")
    ],
    targets: [
        .target(
            name: "Styleguide",
            dependencies: [],
            resources: [
                .process("Resources")
            ],
            plugins: [.plugin(name: "SwiftGenPlugin", package: "BuildTools")]
        ),
        .testTarget(
            name: "StyleguideTests",
            dependencies: ["Styleguide"]
        )
    ]
)
