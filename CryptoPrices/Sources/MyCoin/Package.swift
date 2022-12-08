// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyCoin",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MyCoin",
            targets: ["MyCoin"]
        )
    ],
    dependencies: [
        .package(name: "Styleguide", path: "../Styleguide")
    ],
    targets: [
        .target(
            name: "MyCoin",
            dependencies: [.product(name: "Styleguide", package: "Styleguide")]
        ),
        .testTarget(
            name: "MyCoinTests",
            dependencies: ["MyCoin"])
    ]
)
