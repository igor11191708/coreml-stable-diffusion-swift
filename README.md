# CoreML stable diffusion image generation

There are numerous versions of Stable Diffusion available on the Hugging Face Hub

# How to use
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

# How to run an example app

## 1. Download a prepared model from Hugging Face Hub
You can open a couple of links to the models from the UI of the example app

  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/links_to_models.png) 
or follow the links 
- [Apple models](https://huggingface.co/apple) 
- [Core ML community models](https://huggingface.co/coreml) 

The example app supports **split-einsum** models. I decided to support only this type of models because they are the fastest in terms of image generation.
To get positive result from the app example download only this type of models
### Text-to-Image models
- [coreml/coreml-stable-diffusion-v1-5](https://huggingface.co/coreml/coreml-stable-diffusion-v1-5/tree/main/split-einsum) 
- [coreml/coreml-vintedois-diffusion](https://huggingface.co/coreml/coreml-vintedois-diffusion/tree/main/split_einsum)
### Image-to-Image models
- [coreml/coreml-epic-diffusion](https://huggingface.co/coreml/coreml-epic-diffusion/tree/main/split_einsum)
- [coreml/coreml-Analog-Diffusion](https://huggingface.co/coreml/coreml-Analog-Diffusion/tree/main/split-einsum)

### Pytorch to CoreML
if you want to prepare model bundle on your own take a look on this tutorial
[Stable Diffusion on Apple Silicon](https://www.youtube.com/watch?v=uY_Ty-F0CG8&list=LL&index=2)

## Put the models to working model directory
Click the button **Local models** and move there downloaded models
  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/links_to_models.png)   
  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/local_models.png) 
