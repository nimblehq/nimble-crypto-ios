// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/Thieurom/Pilot", from: "0.5.1")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                .product(name: "Entities", package: "Domain"),
                .product(name: "RepositoryProtocol", package: "Domain"),
                .product(name: "Pilot", package: "Pilot"),
                .product(name: "PilotType", package: "Pilot")
            ]
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]
        )
    ]
)
