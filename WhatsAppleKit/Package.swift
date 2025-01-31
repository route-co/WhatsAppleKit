// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "WhatsAppleKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "WhatsAppleKit",
            targets: ["WhatsAppleKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.7.0")
    ],
    targets: [
        .target(
            name: "WhatsAppleKit",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "CryptoSwift", package: "CryptoSwift")
            ]),
        .testTarget(
            name: "WhatsAppleKitTests",
            dependencies: ["WhatsAppleKit"])
    ]
)