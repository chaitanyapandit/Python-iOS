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
        .binaryTarget(name: "libpython3", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libpython3.xcframework.zip", checksum: "dcfec28bf5d40b8180d2d5c84baca5be98ad52b543e4516ee1c5b2f7f268d24f"),
        .binaryTarget(name: "libssl", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libssl.xcframework.zip", checksum: "7f01d582114ff1ed9595e69fe0dbfd9ecaddf4ecc59fc069d8a23739f582ddeb"),
        .binaryTarget(name: "libcrypto", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libcrypto.xcframework.zip", checksum: "1d9a714c4ddf3d4018146797644f471b1163ce4c479edf69ee0ea28bb0d9766a"),
        .binaryTarget(name: "libffi", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libffi.xcframework.zip", checksum: "a591273c5cb86a2444e2f6c25be86f0016310c2f745b3a094ab8ca1dbd301c20"),
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
