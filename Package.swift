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
            url: "https://github.com/HiZeusai/SDKPackage/releases/download/2.1.8/GFacebook_2.1.8_fixbundle.zip",
            checksum: "b21543bd6fd5ad6d5550229cab51a7d58e30385768cf6607104b187e27db0016"
        ),
        .target(
            name: "ZUSDKFacebookWrapper",
            dependencies: [
                "GFacebook",
                .product(name: "FacebookShare", package: "facebook-ios-sdk")
            ],
            path: "Sources"
        ),
    ]
)
