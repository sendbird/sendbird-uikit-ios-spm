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
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios",
            from: "4.0.12"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v3.1.3/SendbirdUIKit.xcframework.zip",
            checksum: "2dee0a412ba8db52072b12b079518dc4fa52158bb3340f1c8bb3088aeeb319bf"
        ),
        .target(
            name: "SendbirdUIKitTarget",
            dependencies: [
                .target(name: "SendbirdUIKit"),
                .product(name: "SendbirdChatSDK", package: "SendbirdChatSDK")
            ],
            path: "Sources"
        ),
    ]
)
