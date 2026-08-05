// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Kokoro",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "Kokoro", targets: ["Kokoro"]),
        .executable(name: "KokoroCLI", targets: ["KokoroCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SeamusWaldron/misaki", from: "0.1.1"),
        .package(url: "https://github.com/SeamusWaldron/mlx-swift", exact: "0.29.99")
    ],
    targets: [
        .target(
            name: "Kokoro",
            dependencies: [
                .product(name: "Misaki", package: "misaki"),
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXFast", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
            ]
        ),
        .executableTarget(
            name: "KokoroCLI",
            dependencies: ["Kokoro"]
        ),
        .testTarget(
            name: "KokoroTests",
            dependencies: [
                "Kokoro",
                .product(name: "Misaki", package: "misaki"),
            ]
        ),
    ]
)
