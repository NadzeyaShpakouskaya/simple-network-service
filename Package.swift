// swift-tools-version: 5.8

import PackageDescription

private let packageName = "SimpleNetworkService"
private let networkService = "NetworkService"
private let networkServiceTest = networkService + "Tests"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: networkService,
            targets: [networkService]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: networkService,
            dependencies: []
        ),
        .testTarget(
            name: networkServiceTest,
            dependencies: [.target(name: networkService)]
        )
    ]
)
