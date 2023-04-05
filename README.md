# CoreML stable diffusion image generation

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FThe-Igor%2Fcoreml-stable-diffusion-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/The-Igor/coreml-stable-diffusion-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FThe-Igor%2Fcoreml-stable-diffusion-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/The-Igor/coreml-stable-diffusion-swift)

The package is a mediator between [Apple's Core ML Stable Diffusion implementation](https://github.com/apple/ml-stable-diffusion) and your app that let you run text-to-image or image-to-image models
  
## How to use the package
### 1. Create GenerativeManager

```swift
   let manager = GenerativeManager()
```
### 2. Run async method **generate**

```swift
       let images: [CGImage?] = try await manager.generate(
                with: config, 
                by: pipeline
            )
```

## SwiftUI example

[CoreML stable diffusion image generation](https://github.com/The-Igor/coreml-stable-diffusion-swift-example)

  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_01.png)

## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)
- Go to Product > Build Documentation or **⌃⇧⌘ D**

## Used packages
- [Files](https://github.com/JohnSundell/Files)
- [Stable Diffusion](https://github.com/apple/ml-stable-diffusion)
