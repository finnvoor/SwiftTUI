// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftTUI",
    platforms: [.macOS(.v11)],
    products: [.library(name: "SwiftTUI", targets: ["SwiftTUI"])],
    targets: [.target(name: "SwiftTUI")]
)
