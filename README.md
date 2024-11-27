# CoreML stable diffusion image generation

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Figor11191708%2Fcoreml-stable-diffusion-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/igor11191708/coreml-stable-diffusion-swift)

The package is a mediator between Apple's Core ML Stable Diffusion implementation and your app that let you run text-to-image or image-to-image models

## [SwiftUI example](https://github.com/The-Igor/coreml-stable-diffusion-swift-example)
  
## [Documentation(API)](https://swiftpackageindex.com/igor11191708/coreml-stable-diffusion-swift/main/documentation/coreml_stable_diffusion_swift)
  
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
  
### Typical set of files for a model und the purpose of each file

| File Name                            | Description                                                      |
|--------------------------------------|------------------------------------------------------------------|
| `TextEncoder.mlmodelc`               | Encodes input text into a vector space for further processing.   |
| `Unet.mlmodelc`                      | Core model handling the transformation of encoded vectors into intermediate image representations. |
| `UnetChunk1.mlmodelc`                | First segment of a segmented U-Net model for optimized processing in environments with memory constraints. |
| `UnetChunk2.mlmodelc`                | Second segment of the segmented U-Net model, completing the tasks started by the first chunk. |
| `VAEDecoder.mlmodelc`                | Decodes the latent representations into final image outputs.     |
| `VAEEncoder.mlmodelc`                | Compresses input image data into a latent space for reconstruction or further processing. |
| `SafetyChecker.mlmodelc`             | Ensures generated content adheres to safety guidelines by checking against predefined criteria. |
| `vocab.json`                         | Contains the vocabulary used by the text encoder for tokenization and encoding processes. |
| `merges.txt`                         | Stores the merging rules for byte-pair encoding used in the text encoder. |  
  
## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)
- Go to Product > Build Documentation or **⌃⇧⌘ D**

## Used packages
- [Files](https://github.com/JohnSundell/Files)
- [Stable Diffusion](https://github.com/apple/ml-stable-diffusion)
