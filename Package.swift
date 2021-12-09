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
            from: "3.1.1"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v2.2.1/SendBirdUIKit.xcframework.zip",
            checksum: "f3616ee10a0d7342950d7b191056c2235900462c35f52ac456874fb01d9a580b"
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
