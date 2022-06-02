// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SendbirdUIKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "SendbirdUIKit",
            targets: ["SendbirdUIKitTarget"]
        ),
    ],
    dependencies: [
        .package(
            name: "SendBirdSDK",
            url: "https://github.com/sendbird/sendbird-chat-ios-spm",
            from: "3.1.13"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v3.0.0-beta.3/SendbirdUIKit.xcframework.zip",
            checksum: "c31ce9fec29c3f56eb545a93ef896b3333449f22accfa7903917e920745dcc34"
        ),
        .target(
            name: "SendbirdUIKitTarget",
            dependencies: [
                .target(name: "SendbirdUIKit"),
                .product(name: "SendBirdSDK", package: "SendBirdSDK")
            ],
            path: "Sources"
        ),
    ]
)
