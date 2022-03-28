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
            from: "3.1.7"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v2.2.6/SendBirdUIKit.xcframework.zip",
            checksum: "a05d57b75f68e75bf9842e19121bd40f329e29f456b7f48a4b3c080f980655b7"
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
