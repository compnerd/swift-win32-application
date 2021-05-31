// swift-tools-version:5.4

import PackageDescription

#if swift(>=5.5)
let GUISwiftSettings: [SwiftSetting] = [
  // Instruct the compiler to generate the entry point as `wWinMain`
  // rather than `main` to ensure that the application is correctly
  // marked as a GUI application (Windows subsystem).  This is done
  // by the linker based upon the main entry point.  Simply marking
  // the subsystem is insufficient as the compiler will materialize
  // the entry point as `main`, resulting in an undefined symbol.
  .unsafeFlags([
    "-Xfrontend", "-entry-point-function-name",
    "-Xfrontend", "wWinMain",
  ]),
]
let GUILinkerSettings: [LinkerSetting] = [
]
#else
let GUISwiftSettings: [SwiftSetting] = [
]
let GUILinkerSettings: [LinkerSetting] = [
  .unsafeFlags(["-Xlinker", "/SUBSYSTEM:WINDOWS"]),
]
#endif

let Application = Package(
  name: "Application",
  products: [
    .executable(name: "Application", targets: ["Application"]),
  ],
  dependencies: [
    .package(name: "SwiftWin32", url: "https://github.com/compnerd/swift-win32.git",
             .branch("main")),
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: [
        "SwiftWin32",
      ],
      exclude: [
        "Application.exe.manifest",
        "Info.plist",
      ],
      swiftSettings: GUISwiftSettings,
      linkerSettings: GUILinkerSettings
    ),
    .testTarget(name: "ApplicationTests", dependencies: ["Application"]),
  ]
)
