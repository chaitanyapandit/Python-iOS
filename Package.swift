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
        .binaryTarget(name: "libpython3", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libpython3.xcframework.zip", checksum: "20a048a5229e149197c8d238cea76e1278503a1c12be55cf3d75c7871e99b675"),
        .binaryTarget(name: "libssl", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libssl.xcframework.zip", checksum: "e97409df3d0d654877acb41426c8b66168a3d3d5601a6d814a28a56a7b7b073f"),
        .binaryTarget(name: "libcrypto", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libcrypto.xcframework.zip", checksum: "d0ccab3412dfa15278a694434e72b8e0d949a5310a9e94c2a5a7246b4e64cf54"),
        .binaryTarget(name: "libffi", url: "https://github.com/chaitanyapandit/Python-iOS/releases/download/macOS-target/libffi.xcframework.zip", checksum: "8c0e6a3c4173dd9445a6c902f5662b8f9f53853f04071a06c9b948aa43febf6d"),
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
