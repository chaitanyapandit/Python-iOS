// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Python-iOS",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_15)
    ],

    products: [
        .library(
            name: "Python-iOS",
            targets: [ // order matters!
                "LinkPython",
                "libpython3", "libssl", "libcrypto", "libffi",
                "PythonSupport",
            ]),
    ],
    targets: [
        .binaryTarget(name: "libpython3", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libpython3.xcframework.zip", checksum: "434baeacdbf84e6d9b595d4930080b04c5102ee22f1cc51b013c393eec43393f"),
        .binaryTarget(name: "libssl", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libssl.xcframework.zip", checksum: "448ed0b198b587d6c034015b5253c96682dfb8cc53b61db778a6ee03c6137f42"),
        .binaryTarget(name: "libcrypto", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libcrypto.xcframework.zip", checksum: "7a1e805a99b8b162cc895a05746c460c77999a12f7b9dff0755f88c28da22cd4"),
        .binaryTarget(name: "libffi", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libffi.xcframework.zip", checksum: "5c5c91f0152e7a086ff06ee53c5ee763156bcf5aeb2a65afc6d9997f58b20577"),
        .target(name: "LinkPython",
                dependencies: [
                    "libpython3",
                    "libssl",
                    "libcrypto",
                    "libffi",
                ],
                linkerSettings: [
                    .linkedLibrary("z"),
                    .linkedLibrary("sqlite3"),
                ]
        ),
        .target(name: "PythonSupport",
                dependencies: ["LinkPython"],
                resources: [.copy("lib")]),
        .testTarget(
            name: "PythonTests",
            dependencies: ["PythonSupport"]),
    ]
)
