// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SendBirdUIKit",
    platforms: [.iOS(.v10)],
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
            from: "3.0.236"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v2.1.16/SendBirdUIKit.xcframework.zip",
            checksum: "e94f0abcebbc548ac46855390eecf1030258dc6f0e4fbdff0224ee98fd62252d"
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
