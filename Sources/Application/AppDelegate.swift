// Copyright © #{year} #{author}
// SPDX-License-Identifier: BSD-3-Clause

import SwiftWin32
#if swift(<5.5)
import WinSDK
#endif

@main
final class Application: ApplicationDelegate {
}

#if swift(<5.5)
@_silgen_name("wWinMain")
func wWinMain(_ hInstance: HINSTANCE, _ hPrevInstance: HINSTANCE,
              _ pCmdLine: PWSTR, _ nCmdShow: CInt) -> CInt {
  return ApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, nil)
}
#endif
