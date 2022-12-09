// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Entities",
            targets: ["Entities"]
        ),
        .library(
            name: "RepositoryProtocol",
            targets: ["RepositoryProtocol"]
        ),
        .library(
            name: "UseCaseProtocol",
            targets: ["UseCaseProtocol"]
        ),
        .library(
            name: "UseCases",
            targets: ["UseCases"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick", from: "6.1.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "11.2.1")
    ],
    targets: [
        .target(
            name: "Entities",
            dependencies: []
        ),
        .target(
            name: "RepositoryProtocol",
            dependencies: ["Entities"]
        ),
        .target(
            name: "UseCaseProtocol",
            dependencies: ["Entities"]
        ),
        .target(
            name: "UseCases",
            dependencies: [
                "RepositoryProtocol",
                "UseCaseProtocol"
            ]
        ),
        .testTarget(
            name: "UseCasesTests",
            dependencies: [
                "UseCases",
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble")
            ]
        )
    ]
)
