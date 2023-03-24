//
//  ModelsManager.swift
//  
//
//  Created by Igor on 24.03.2023.
//

import Foundation
import StableDiffusion
import CoreML

/// The manager for generating images
@available(iOS 16.2, macOS 13.1, *)
public actor GenerativeManager{
   
    // MARK: - Life circle
    
    public init(){ }
    
    // MARK: - API
    
    /// Load list of models
    /// - Returns: List of  models
    public func loadModels() async -> [GenerativeModel] {
         await listOfModels()
    }
    
    /// Generate images
    /// - Parameters:
    ///   - config: mage generation configuration
    ///   - pipeline: A pipeline used to generate image samples from text input using stable diffusion
    /// - Returns: An array of `imageCount` optional images.
    ///            The images will be nil if safety checks were performed and found the result to be un-safe
    public func generate(
        with config: StableDiffusionPipeline.Configuration,
        by pipeline: StableDiffusionPipeline
    ) async throws -> [CGImage?]
    {
        try pipeline.generateImages(configuration: config) { progress in
            #if DEBUG
                print(progress.step)
            #endif
            return !Task.isCancelled
        }
    }
    
    /// Get image generation configuration
    /// - Parameters:
    ///   - prompt: Text prompt to guide sampling
    ///   - negativePrompt: Negative text prompt to guide sampling
    ///   - inputImage: Starting image for image2image or in-painting
    ///   - seed: Random seed which to start generation
    ///   - strength: Strength
    ///   - guidanceScale: Controls the influence of the text prompt on sampling process (0=random images)
    ///   - stepCount: Number of inference steps to perform
    ///   - disableSafety: Safety checks
    ///   - schedulerType: The type of Scheduler to use
    /// - Returns: Image generation configuration
    nonisolated
    public func getConfig (
        _ prompt : String,
        _ negativePrompt : String,
        _ inputImage : CGImage?,
        _ seed : UInt32,
        _ strength : Float,
        _ guidanceScale : Float,
        _ stepCount : Float,
        _ disableSafety : Bool,
        _ schedulerType : StableDiffusionScheduler
        ) -> StableDiffusionPipeline.Configuration{
            var cfg = StableDiffusionPipeline.Configuration(prompt: prompt)

            cfg.startingImage = inputImage
            cfg.negativePrompt = negativePrompt
            cfg.strength = strength
            cfg.stepCount = Int(stepCount)
            cfg.seed = seed
            cfg.guidanceScale = guidanceScale
            cfg.disableSafety = disableSafety
            cfg.schedulerType = schedulerType
            
            return cfg
    }
}
