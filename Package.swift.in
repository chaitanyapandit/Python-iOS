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
        .binaryTarget(name: "libpython3", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libpython3.xcframework.zip", checksum: "59d2fd89373a8504e894352190e5fade835698bcb5d52fdaef5c998d2bf5c318"),
        .binaryTarget(name: "libssl", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libssl.xcframework.zip", checksum: "bba7c0517a77f5789fcb45eb73f1df63dfe961999b7c60ad6b2ccb505f34b6dd"),
        .binaryTarget(name: "libcrypto", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libcrypto.xcframework.zip", checksum: "0a528f92019ee0e3c5b8efc6eb27416f386ad1a322acafabb7de1b8b0508e386"),
        .binaryTarget(name: "libffi", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libffi.xcframework.zip", checksum: "ea89ccb657e310f91075c0e086083631d0b1a6d6e033efbb284ea353e32c894c"),
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
