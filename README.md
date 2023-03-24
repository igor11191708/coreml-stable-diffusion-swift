# CoreML stable diffusion image generation

There are numerous versions of Stable Diffusion available on the Hugging Face Hub

  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/app_example.png) 

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

## How to run the example app

### 1. Download a prepared **split einsum** model from Hugging Face Hub.
You can follow to the set of ready to use models from the UI of the example app by clicking on buttons **Apple models** or **CoreML models**

  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/links_to_models.png) 
or follow the links 
- [Apple models](https://huggingface.co/apple) 
- [Core ML community models](https://huggingface.co/coreml) 

The example app supports **split-einsum** models. I decided to support only this type of models because they are the fastest in terms of image generation.
To get positive result from the app example download only this type of models
#### Text-to-Image models
- [coreml/coreml-stable-diffusion-v1-5](https://huggingface.co/coreml/coreml-stable-diffusion-v1-5/tree/main/split-einsum) 
- [coreml/coreml-vintedois-diffusion](https://huggingface.co/coreml/coreml-vintedois-diffusion/tree/main/split_einsum)
#### Image-to-Image models
- [coreml/coreml-epic-diffusion](https://huggingface.co/coreml/coreml-epic-diffusion/tree/main/split_einsum)
- [coreml/coreml-Analog-Diffusion](https://huggingface.co/coreml/coreml-Analog-Diffusion/tree/main/split-einsum)

#### Pytorch to CoreML
if you want to prepare model bundle on your own take a look on this tutorial
[Stable Diffusion on Apple Silicon](https://www.youtube.com/watch?v=uY_Ty-F0CG8&list=LL&index=2)

### 2. Put the models to working model directory
Click the button **Local models** and move there downloaded models
  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/local_button.png)   
  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/local_models_folder.png) 

### 3. Run the app example
Take a look on the video demonstration



## SwiftUI example for the package

[CoreML stable diffusion image generation example](https://github.com/The-Igor/stable-diffusion-swift-example)

## Used by packages

[Replicate toolkit for swift](https://github.com/The-Igor/replicate-kit-swift)
