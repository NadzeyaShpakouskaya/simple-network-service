// swift-tools-version: 5.8

import PackageDescription

private let packageName = "SimpleNetworkService"
private let packageTestName = "SimpleNetworkServiceTests"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: packageName,
            targets: [packageName]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: packageName,
            dependencies: []
        ),
        .testTarget(
            name: packageTestName,
            dependencies: [.byName(name: packageName)]
        )
    ]
)
