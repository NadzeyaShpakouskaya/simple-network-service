// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkService",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NetworkService",
            targets: ["NetworkService"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NetworkService",
            dependencies: []),
        .testTarget(
            name: "NetworkServiceTests",
            dependencies: ["NetworkService"]),
    ]
)
