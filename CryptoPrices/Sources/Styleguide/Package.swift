// swift-tools-version: 5.5
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
    dependencies: [],
    targets: [
        .target(
            name: "Styleguide",
            dependencies: [],
            resources: [
                .process("Resources/Inter")
            ]
        ),
        .testTarget(
            name: "StyleguideTests",
            dependencies: ["Styleguide"]
        )
    ]
)
