// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Helper",
    products: [
        .library(name: "Helper", targets: ["CHelper"]),
    ],
    targets: [
        .target(name: "CHelper"),
        .testTarget(name: "CHelperTests", dependencies: ["CHelper"]),
    ]
)
