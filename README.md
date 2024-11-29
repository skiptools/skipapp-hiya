# HiyaSkip

This is a [Skip](https://skip.tools) dual-platform app project
that demonstrates the integration between a native Swift model
layer compiled for Android connected to a transpiled SwiftUI
user interface. For more information on using natively-compiled
Swift on Android, see the
[native swift documentation](https://skip.tools/docs/native).

This is the exact project with will be output when running the command:

```
skip init --appid=hiya.skip skipapp-hiya HiyaSkip HiyaSkipModel HiyaSkipLogic
```

The package will contain three modules:

1. A top-level `HiyaSkip` target that uses SwiftUI that will be transpiled to Jetpack Compose on Android to make up the user interface portion of the app
2. A `HiyaSkipModel` model layer that will be compiled natively for both Android and iOS. It contains an `@Observable ViewModel` that will be used directly on iOS, and on Android will be bridged to the transpiled user-interface layer using [SkipFuse](https://github.com/skiptools/skip-fuse) and [SkipBridge](https://github.com/skiptools/skip-bridge).
3. A pure swift cross-platform `HiyaSkipLogic` module that does not use any bridging, and is depended on by `HiyaSkipModel`


The project structure looks like:

```
skipapp-hiya/
├── Android
│   ├── app
│   │   ├── build.gradle.kts
│   │   ├── proguard-rules.pro
│   │   └── src
│   │       └── main
│   │           ├── AndroidManifest.xml
│   │           └── kotlin
│   │               └── hiya
│   │                   └── skip
│   │                       └── Main.kt
│   ├── gradle.properties
│   └── settings.gradle.kts
├── Darwin
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── Entitlements.plist
│   ├── HiyaSkip.xcconfig
│   ├── HiyaSkip.xcodeproj
│   │   └── project.pbxproj
│   ├── Info.plist
│   └── Sources
│       └── HiyaSkipAppMain.swift
├── Package.swift
├── README.md
├── Skip.env
├── Sources
│   ├── HiyaSkip
│   │   ├── ContentView.swift
│   │   ├── HiyaSkipApp.swift
│   │   ├── Resources
│   │   │   ├── Localizable.xcstrings
│   │   │   └── Module.xcassets
│   │   │       └── Contents.json
│   │   └── Skip
│   │       └── skip.yml
│   ├── HiyaSkipLogic
│   │   └── HiyaSkipLogic.swift
│   └── HiyaSkipModel
│       ├── Resources
│       │   └── Localizable.xcstrings
│       ├── Skip
│       │   └── skip.yml
│       └── ViewModel.swift
└── Tests
    ├── HiyaSkipModelTests
    │   ├── HiyaSkipModelTests.swift
    │   ├── Resources
    │   │   └── TestData.json
    │   ├── Skip
    │   │   └── skip.yml
    │   └── XCSkipTests.swift
    └── HiyaSkipTests
        ├── HiyaSkipTests.swift
        ├── Resources
        │   └── TestData.json
        ├── Skip
        │   └── skip.yml
        └── XCSkipTests.swift

```



## Building

This project is both a stand-alone Swift Package Manager module,
as well as an Xcode project that builds and transpiles the project
into a Kotlin Gradle project for Android using the Skip plugin.

Building the module requires that Skip be installed using
[Homebrew](https://brew.sh) with `brew install skiptools/skip/skip`.

This will also install the necessary transpiler prerequisites:
Kotlin, Gradle, and the Android build tools.

Installation prerequisites can be confirmed by running `skip checkup`.

## Testing

The module can be tested using the standard `swift test` command
or by running the test target for the macOS destination in Xcode,
which will run the Swift tests as well as the transpiled
Kotlin JUnit tests in the Robolectric Android simulation environment.

Parity testing can be performed with `skip test`,
which will output a table of the test results for both platforms.

## Running

Xcode and Android Studio must be downloaded and installed in order to
run the app in the iOS simulator / Android emulator.
An Android emulator must already be running, which can be launched from 
Android Studio's Device Manager.

To run both the Swift and Kotlin apps simultaneously, 
launch the HiyaSkipApp target from Xcode.
A build phases runs the "Launch Android APK" script that
will deploy the transpiled app a running Android emulator or connected device.
Logging output for the iOS app can be viewed in the Xcode console, and in
Android Studio's logcat tab for the transpiled Kotlin app.
