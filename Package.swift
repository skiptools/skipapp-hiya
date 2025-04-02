// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "skipapp-hiya",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .macCatalyst(.v17)],
    products: [
        .library(name: "HiyaSkipApp", type: .dynamic, targets: ["HiyaSkip"]),
        .library(name: "HiyaSkipModel", type: .dynamic, targets: ["HiyaSkipModel"]),
        .library(name: "HiyaSkipLogic", type: .dynamic, targets: ["HiyaSkipLogic"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.3.0"),
        .package(url: "https://source.skip.tools/skip-ui.git", from: "1.26.3"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "1.4.2"),
        .package(url: "https://source.skip.tools/skip-fuse.git", from: "1.0.0"),
        .package(url: "https://github.com/theleftbit/BSWFoundation.git", branch: "not-like-us"),
    ],
    targets: [
        .target(name: "HiyaSkip", dependencies: [
            "HiyaSkipModel",
            .product(name: "SkipUI", package: "skip-ui")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "HiyaSkipTests", dependencies: [
            "HiyaSkip",
            .product(name: "SkipTest", package: "skip")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "HiyaSkipModel", dependencies: [
            "HiyaSkipLogic",
            .product(name: "BSWFoundation", package: "BSWFoundation"),
            .product(name: "SkipModel", package: "skip-model"),
            .product(name: "SkipFuse", package: "skip-fuse")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "HiyaSkipModelTests", dependencies: [
            "HiyaSkipModel",
            .product(name: "SkipTest", package: "skip")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "HiyaSkipLogic", dependencies: []),
    ]
)
