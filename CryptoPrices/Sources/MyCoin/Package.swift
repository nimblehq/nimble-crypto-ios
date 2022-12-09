// swift-tools-version: 5.5
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
        .package(name: "Styleguide", path: "../Styleguide"),
        .package(url: "https://github.com/Quick/Quick", from: "6.1.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "11.2.1")
    ],
    targets: [
        .target(
            name: "MyCoin",
            dependencies: [.product(name: "Styleguide", package: "Styleguide")]
        ),
        .testTarget(
            name: "MyCoinTests",
            dependencies: [
                "MyCoin",
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble")
            ]
        )
    ]
)
