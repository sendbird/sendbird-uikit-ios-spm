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
            from: "4.0.8"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdUIKit",
            url: "https://github.com/sendbird/sendbird-uikit-ios/releases/download/v3.1.1/SendbirdUIKit.xcframework.zip",
            checksum: "822409d7e784e1b04ab07feefb0137d13659e276b7fe1175da04f0fd39972514"
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
