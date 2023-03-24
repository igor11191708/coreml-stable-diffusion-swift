//
//  IGenerativeManager.swift
//  
//
//  Created by Igor on 24.03.2023.
//

import Foundation
import StableDiffusion
import CoreML

/// The interface of the manager for generating images
@available(iOS 16.2, macOS 13.1, *)
public protocol IGenerativeManager{
    
    /// Load list of models
    func loadModels() async -> [GenerativeModel]
    
    /// Generate images
    func generate(
        with config: StableDiffusionPipeline.Configuration,
        by pipeline: StableDiffusionPipeline
    ) async throws -> [CGImage?]
    
    nonisolated
    func getConfig (
        _ prompt : String,
        _ negativePrompt : String,
        _ inputImage : CGImage?,
        _ seed : UInt32,
        _ strength : Float,
        _ guidanceScale : Float,
        _ stepCount : Float,
        _ disableSafety : Bool,
        _ schedulerType : StableDiffusionScheduler
        ) -> StableDiffusionPipeline.Configuration
    
}
