# CoreML stable diffusion image generation

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FThe-Igor%2Fcoreml-stable-diffusion-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/The-Igor/coreml-stable-diffusion-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FThe-Igor%2Fcoreml-stable-diffusion-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/The-Igor/coreml-stable-diffusion-swift)

The package is a mediator between Apple's Core ML Stable Diffusion implementation and your app that let you run text-to-image or image-to-image models

## SwiftUI example

[CoreML stable diffusion image generation](https://github.com/The-Igor/coreml-stable-diffusion-swift-example)
  
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
### Performance

 The speed can be unpredictable. Sometimes a model will suddenly run a lot slower than before. It appears as if Core ML is trying to be smart in how it schedules things, but doesn’t always optimal.




  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_01.png)
  
  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_03.png)
  
## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)
- Go to Product > Build Documentation or **⌃⇧⌘ D**

## Used packages
- [Files](https://github.com/JohnSundell/Files)
- [Stable Diffusion](https://github.com/apple/ml-stable-diffusion)
