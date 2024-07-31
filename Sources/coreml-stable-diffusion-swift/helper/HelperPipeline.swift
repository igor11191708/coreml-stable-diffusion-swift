//
//  HelperPipeline.swift
//  
//
//  Created by Igor on 23.03.2023.
//

import Foundation
import StableDiffusion
import CoreML

/// Retrieves a StableDiffusionPipeline configured with the specified parameters.
///
/// - Parameters:
///   - url: The URL where the pipeline resources are located.
///   - disableSafety: A boolean flag to disable safety checks. Default is `false`.
///   - reduceMemory: A boolean flag to reduce memory usage. Default is `false`.
///   - computeUnits: The compute units to be used by the pipeline. Default is `.cpuAndGPU`.
///
/// - Throws: An error if the pipeline initialization fails.
///
/// - Returns: A configured instance of `StableDiffusionPipeline`.

@available(iOS 16.2, macOS 13.1, *)
public func getDiffusionPipeline(
    for url : URL,
    _ controlNet: [String] = [],
    _ disableSafety : Bool = false,
    _ reduceMemory : Bool = false,
    _ computeUnits : MLComputeUnits = .cpuAndGPU
) throws -> StableDiffusionPipeline {
    
    // Initialize the MLModelConfiguration with the specified compute units.
    let config: MLModelConfiguration = .init()
    config.computeUnits = computeUnits
    
    // Return a new StableDiffusionPipeline instance, using the provided URL for resources.
    // The pipeline is configured with optional parameters to disable safety checks and reduce memory usage.
    return try .init(
        resourcesAt: url, // The URL where the pipeline resources are located.
        controlNet: controlNet,   // An empty array for controlNet as no control network is being passed.
        configuration: config, // The MLModelConfiguration object with the compute units setting.
        disableSafety: disableSafety, // A boolean flag to disable safety checks if set to true.
        reduceMemory: reduceMemory // A boolean flag to reduce memory usage if set to true.
    )
}
