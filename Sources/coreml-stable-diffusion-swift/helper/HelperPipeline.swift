//
//  HelperPipeline.swift
//  
//
//  Created by Igor on 23.03.2023.
//

import Foundation
import StableDiffusion
import CoreML

@available(iOS 16.2, macOS 13.1, *)
/// <#Description#>
/// - Parameters:
///   - url: The path to the models files
///   - disableSafety: Disable safety check
///   - reduceMemory: Reduce memory if you use it on devises with limited memory amount
///   - computeUnits: The set of processing-unit configurations the model can use to make predictions
/// - Throws: Errors while creating pipeline
/// - Returns: A pipeline used to generate image samples from text input using stable diffusion
public func getDiffusionPipeline(
    for url : URL,
    _ disableSafety : Bool = false,
    _ reduceMemory : Bool = false,
    _ computeUnits : MLComputeUnits = .cpuAndNeuralEngine
) throws -> StableDiffusionPipeline{
    
    let config: MLModelConfiguration = .init()
    config.computeUnits = computeUnits
    
    return try .init(
        resourcesAt: url,
        configuration : config,
        disableSafety: disableSafety,
        reduceMemory : reduceMemory
    )
}
