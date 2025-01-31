// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WhatsAppleKit",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "WhatsAppleKit",
            targets: ["WhatsAppleKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.80.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.29.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.8.4"),
        .package(url: "https://github.com/apple/swift-system.git", from: "1.4.0")
    ],
    targets: [
        .target(
            name: "WhatsAppleKit",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "SystemPackage", package: "swift-system")
            ]),
        .testTarget(
            name: "WhatsAppleKitTests",
            dependencies: ["WhatsAppleKit"])
    ]
)