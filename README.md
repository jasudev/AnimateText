## This code is forked from @jasudev and it supports multiline texts. To customize the UI, simply go to AnimateText file and edit lines that are commented on.




# **AnimateText for SwiftUI**
This library for animating text. Developed with SwiftUI. This library supports iOS/macOS.

[![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS-blue?style=flat-square)](https://developer.apple.com/macOS)
[![iOS](https://img.shields.io/badge/iOS-14.0-blue.svg)](https://developer.apple.com/iOS)
[![macOS](https://img.shields.io/badge/macOS-11.0-blue.svg)](https://developer.apple.com/macOS)
[![instagram](https://img.shields.io/badge/instagram-@dev.fabula-orange.svg?style=flat-square)](https://www.instagram.com/dev.fabula)
[![SPM](https://img.shields.io/badge/SPM-compatible-red?style=flat-square)](https://developer.apple.com/documentation/swift_packages/package/)
[![MIT](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)  

## Screenshot
https://user-images.githubusercontent.com/1617304/153016287-73f15db7-b642-4c4d-afc7-b3ecb2a17640.mp4

## Example
[https://fabulaapp.page.link/224](https://fabulaapp.page.link/224)

## Usages
1. AnimateText
    ```swift
    /// A view that animates binding text. Passing the effect type as a generic.
    /// struct AnimateText<E> where E : ATTextAnimateEffect
    /// Binding the text to be expressed.
    @State var text: String = "AnimateText"
    
    /// The type used to split text.
    @State var type: ATUnitType = .letters
    
    /// Custom user info for the effect.
    @State var userInfo: Any? = nil
    
    AnimateText<CustomEffect>($text, type: type, userInfo: userInfo)
    
    ```

2. Each effect only needs to conform to the ATTextAnimateEffect protocol.
    ```swift
    /// Custom animation effect.
    public struct CustomEffect: ATTextAnimateEffect {

        public var data: ATElementData
        public var userInfo: Any?

        public init(_ data: ATElementData, _ userInfo: Any?) {
            self.data = data
            self.userInfo = userInfo
        }

        public func body(content: Content) -> some View {
            content
                .opacity(data.value)
                .animation(.easeInOut.delay(Double(data.index) * 0.06), value: data.value)
        }
    }
    ```
    
3. ATTextAnimateEffect protocol
    ```swift
    /// A protocol to implement text animation effects.
    public protocol ATTextAnimateEffect: ViewModifier {

        /// Informational data required for each element animation.
        var data: ATElementData { get }
        /// Custom user info for the effect.
        /// The effect maintains a strong reference to this object until it (the effect) is invalidated. This parameter may be nil.
        var userInfo: Any? { get }

        init(_ data: ATElementData, _ userInfo: Any?)
    }
    
    ```
## Swift Package Manager
The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. Once you have your Swift package set up, adding AnimateText as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/jasudev/AnimateText.git", .branch("main"))
]
```

## Contact
instagram : [@dev.fabula](https://www.instagram.com/dev.fabula)  
email : [dev.fabula@gmail.com](mailto:dev.fabula@gmail.com)

## License
AnimateText is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
