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
        .package(url: "https://github.com/vincentleclerc/DTFoundation.git", Package.Dependency.Requirement._revisionItem("4b2bf282d08be051c50c1946fd7ac3170cdb66a1"))
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
            	.copy("Source/default.css")]
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
