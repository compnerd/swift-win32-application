# Windows Empty Swift Application Template

This provides a template project to build a Swift application on Windows using
[Swift/Win32](https://github.com/compnerd/swift-win32).

### Build Requirements

- Swift 5.4 or newer
- Windows SDK 10.0.10773 or newer
- Swift/Win32 development

### Building

The project can be built using Swift Package Manager's build command.
Additionaly, the application needs to have a manifest integrated into the
binary.  This requires additional operations which cannot be automated with
Swift Package Manager currently.  Additionally, some files need to be deployed
manually as they need to be placed in a specific layout.

Currently, the LLVM manifest tool (`llvm-mt`) is unable to perform the operation
and thus this must be done with the MSVC toolset.

```cmd
swift build
mt -nologo -manifest Sources\Application\Application.exe.manifest -outputresource:.build\x86_64-unknown-windows-msvc\debug\Application.exe
copy Sources\Application\Info.plist .build\x86_64-unknown-windows-msvc\debug\
```

### Testing

The project uses [XCTest](https://github.com/apple/swift-corelibs-xctest) to add
unit tests.  You can run the unit test suite using Swift Package Manager's test
command.

```cmd
swift test
```

### Debugging

In order to debug the package, there are two options.  In order to debug with
LLDB, which is required for debugging Swift code, the linker needs to preserve
the debug information.  This is accomplished by passing an additional flag
during the build.

```cmd
swift build -Xlinker -debug:dwarf
```

When trying to debug the interactions with the system, it is convenient to use
the Windows tooling for debugging (e.g. WinDBG).  In such a case, the debug
information needs to be emitted for Windows.  This requires passing additonal
flags to Swift Package Manager.

```cmd
swift build -Xswiftc -g -Xswiftc -debug-info-format=codeview -Xlinker -debug
```
