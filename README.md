# CoreML stable diffusion image generation

The package is a mediator between [Apple's Core ML Stable Diffusion implementation](https://github.com/apple/ml-stable-diffusion) and your app that let you run text-to-image or image-to-image models
  
## How to use the package
### 1. Create GenerativeManager

```swift
   let manager = GenerativeManager()
```
### 2. Run async method

```swift
       let images: [CGImage?] = try await manager.generate(
                with: config, 
                by: pipeline
            )
```

## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)
- Go to Product > Build Documentation or **⌃⇧⌘ D**

## Used packages
- [Files](https://github.com/JohnSundell/Files)
- [Stable Diffusion](https://github.com/apple/ml-stable-diffusion)
