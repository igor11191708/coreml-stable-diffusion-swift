//
//  ModelsManager.swift
//  
//
//  Created by Igor on 24.03.2023.
//

import Foundation
import StableDiffusion
import CoreML

@available(iOS 16.2, macOS 13.1, *)
public actor ModelsManager{
   
    public init(){ }
    
    // MARK: - API
    
    /// Load list of models
    /// - Returns: List of  models
    public func loadModels() async -> [GenerativeModel] {
         await listOfModels()
    }
    
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
