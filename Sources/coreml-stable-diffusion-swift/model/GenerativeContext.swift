//
//  GenerativeContext.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation
import StableDiffusion
import CoreML
import AppKit

@available(iOS 16.2, macOS 13.1, *)
public struct GenerativeContext: Hashable{
    
    let config : StableDiffusionPipeline.Configuration
    
    let computeUnits: MLComputeUnits = .cpuAndNeuralEngine
}

@available(iOS 16.2, macOS 13.1, *)
public func getConfig (
    _ prompt : String,
    _ negativePrompt : String,
    _ inputImage : Data?, //CGImage?
    _ seed : UInt32,
    _ strength : Float,
    _ guidanceScale : Float,
    _ stepCount : Float,
    _ disableSafety : Bool,
    _ schedulerType : StableDiffusionScheduler
    ) -> StableDiffusionPipeline.Configuration{
        var cfg = StableDiffusionPipeline.Configuration(prompt: prompt)
        
        if let data = inputImage{
            cfg.startingImage = getCGImage(from: data)
        }
        cfg.negativePrompt = negativePrompt
        cfg.strength = strength
        cfg.stepCount = Int(stepCount)
        cfg.seed = seed
        cfg.guidanceScale = guidanceScale
        cfg.disableSafety = disableSafety
        cfg.schedulerType = schedulerType
        
        return cfg
}


