// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZSSDK_zusdk_facebook",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ZUSDK_Facebook",
            targets: ["ZUSDKFacebookWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/facebook/facebook-ios-sdk.git", from: "15.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "GFacebook",
            url: "https://github.com/HiZeusai/SDKPackage/releases/download/2.1.8/GFacebook_2.1.8.zip",
            checksum: "24dea0671363516ee41c564bc74fe5d44685b4de3f1bafb8f259c492197375ec"
        ),
        .target(
            name: "ZUSDKFacebookWrapper",
            dependencies: [
                "GFacebook",
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "FacebookLogin", package: "facebook-ios-sdk"),
                .product(name: "FacebookShare", package: "facebook-ios-sdk")
            ],
            path: "Sources"
        ),
    ]
)
