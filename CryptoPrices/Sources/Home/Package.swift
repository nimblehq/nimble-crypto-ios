// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Home",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]
        )
    ],
    dependencies: [
        .package(name: "BuildTools", path: "../BuildTools"),
        .package(name: "Styleguide", path: "../Styleguide"),
        .package(name: "Domain", path: "../Domain"),
        .package(name: "TestHelpers", path: "../TestHelpers"),
        .package(url: "https://github.com/Quick/Quick", from: "6.1.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "11.2.1")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                .product(name: "Styleguide", package: "Styleguide"),
                .product(name: "UseCaseProtocol", package: "Domain"),
                .product(name: "DomainTestHelpers", package: "Domain")
            ],
            plugins: [.plugin(name: "SwiftGenPlugin", package: "BuildTools")]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: [
                "Home",
                .product(name: "UseCaseProtocol", package: "Domain"),
                .product(name: "DomainTestHelpers", package: "Domain"),
                .product(name: "TestHelpers", package: "TestHelpers"),
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble")
            ]
        )
    ]
)
