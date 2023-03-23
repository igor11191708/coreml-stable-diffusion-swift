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
