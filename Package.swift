// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PhoneNumberKitDependency",
	platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PhoneNumberKitDependency",
            targets: ["PhoneNumberKitDependency"]),
    ],
    dependencies: [
		.package(url: "https://github.com/marmelroy/PhoneNumberKit.git", from: "3.5.7"),
		.package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "0.1.4")
    ],
    targets: [
        .target(
            name: "PhoneNumberKitDependency",
            dependencies: [
				.product(name: "Dependencies", package: "swift-dependencies")
			]
		),
		.target(
			name: "PhoneNumberKitDependencyLive",
			dependencies: [
				"PhoneNumberKitDependency",
				.product(name: "PhoneNumberKit", package: "PhoneNumberKit"),
			]
		),
        .testTarget(
            name: "PhoneNumberKitDependencyTests",
            dependencies: ["PhoneNumberKitDependencyLive"]
		),
    ]
)
