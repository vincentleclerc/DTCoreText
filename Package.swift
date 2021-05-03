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
        .package(url: "https://github.com/vincentleclerc/DTFoundation.git", Package.Dependency.Requirement._revisionItem("888456bb8c12ff16888692c021b293daf9f07b0d"))
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
                .unsafeFlags(["-fembed-bitcode"]),
                .define("BITCODE_GENERATION_MODE", to: "bitcode")
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
