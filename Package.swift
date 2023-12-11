// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftTUI",
    products: [.library(name: "SwiftTUI", targets: ["SwiftTUI"])],
    targets: [
        .target(name: "SwiftTUI"),
        .testTarget(name: "SwiftTUITests", dependencies: ["SwiftTUI"])
    ]
)
