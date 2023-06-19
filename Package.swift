// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "SimpleNetworkService",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SimpleNetworkService",
            targets: ["SimpleNetworkService"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SimpleNetworkService",
            dependencies: []),
        .testTarget(
            name: "SimpleNetworkServiceTests",
            dependencies: ["SimpleNetworkService"]),
    ]
)
