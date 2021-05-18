// swift-tools-version:5.4

import PackageDescription

let Application = Package(
  name: "Application",
  products: [
    .executable(name: "Application", targets: ["Application"]),
  ],
  dependencies: [
    .package(url: "https://github.com/compnerd/swift-win32.git",
             .branch("main")),
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: [
        .product(name: "SwiftWin32", package: "swift-win32"),
      ],
      exclude: [
        "Application.exe.manifest",
        "Info.plist",
      ]
    ),
    .testTarget(name: "ApplicationTests", dependencies: ["Application"]),
  ]
)
