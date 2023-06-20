// swift-tools-version: 5.8

import PackageDescription

private let packageName = "SimpleNetworkService"
private let networkServiceTargetName = "NetworkService"
private let networkServiceTest = "\(networkServiceTargetName)Tests"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: packageName,
            targets: [
                networkServiceTargetName,
            ]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: networkServiceTargetName,
            dependencies: []
        ),
        .testTarget(
            name: networkServiceTest,
            dependencies: [
                .target(name: networkServiceTargetName),
            ]
        )
    ]
)
