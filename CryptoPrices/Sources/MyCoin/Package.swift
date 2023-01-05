// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyCoin",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MyCoin",
            targets: ["MyCoin"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "TestHelpers", path: "../TestHelpers"),
        .package(name: "Styleguide", path: "../Styleguide"),
        .package(url: "https://github.com/Quick/Quick", from: "6.1.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "11.2.1"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.2"),
        .package(url: "https://github.com/danielgindi/Charts.git", .upToNextMajor(from: "4.1.0"))
    ],
    targets: [
        .target(
            name: "MyCoin",
            dependencies: [
                .product(name: "Styleguide", package: "Styleguide"),
                .product(name: "UseCaseProtocol", package: "Domain"),
                .product(name: "Charts", package: "Charts"),
                .product(name: "DomainTestHelpers", package: "Domain")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "MyCoinTests",
            dependencies: [
                "MyCoin",
                .product(name: "UseCaseProtocol", package: "Domain"),
                .product(name: "DomainTestHelpers", package: "Domain"),
                .product(name: "TestHelpers", package: "TestHelpers"),
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble")
            ]
        )
    ]
)
