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
            from: "3.1.13"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v2.2.9/SendBirdUIKit.xcframework.zip",
            checksum: "ccbd18c485b6667846ec3d7c629b6102ee224fea97944b445127b53ac60c1664"
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
