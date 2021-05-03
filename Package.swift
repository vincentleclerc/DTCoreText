// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DTCoreText",
    platforms: [
        .iOS(.v9),         //.v8 - .v13
        .macOS(.v10_10),    //.v10_10 - .v10_15
        .tvOS(.v9),        //.v9 - .v13
    ],
    products: [
        .library(
            name: "DTCoreText",
			// type: .dynamic,
            targets: ["DTCoreText"])
    ],
    dependencies: [
        .package(url: "https://github.com/vincentleclerc/DTFoundation.git", Package.Dependency.Requirement._revisionItem("876f87dee8b3a5ab6308a2d1b30b44e5d8e0d6ee"))
//        .package(url: "https://github.com/Cocoanetics/DTFoundation.git", from: "1.7.15"),
    ],
    targets: [
        .target(
            name: "DTCoreText",
            dependencies: [
                .product(name: "DTFoundation", package: "DTFoundation"),
            ],
            path: "Core",
			exclude: ["DTCoreText-Info.plist", "DTCoreText-Prefix.pch"],
            resources: [
               .copy("Source/default.css")],
            cSettings: [
                .define("BITCODE_GENERATION_MODE", to: "bitcode"),
                .define("ENABLE_BITCODE", to: "YES")
            ]
        ),
        .testTarget(
            name: "DTCoreTextTests",
            dependencies: ["DTCoreText"],
			path: "Test/Source",
            resources: [
           		.copy("Resources")]
			)
    ]
)
