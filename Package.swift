// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SendBirdUIKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "SendBirdUIKit",
            targets: ["SendBirdUIKitTarget"]
        ),
    ],
    dependencies: [
        .package(
            name: "SendBirdSDK",
            url: "https://github.com/sendbird/sendbird-chat-ios-spm",
            from: "3.1.39"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v2.2.13/SendBirdUIKit.xcframework.zip",
            checksum: "6f3a30d4b12d5e476b52ac9550a197ddb783ca448f7cd84555c7cdf5facd82a8"
        ),
        .target(
            name: "SendBirdUIKitTarget",
            dependencies: [
                .target(name: "SendBirdUIKit"),
                .product(name: "SendBirdSDK", package: "SendBirdSDK")
            ],
            path: "Sources"
        ),
    ]
)
