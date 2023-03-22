//
//  GenerativeContext.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation
import StableDiffusion
import CoreML

@available(iOS 16.2, macOS 13.1, *)
struct GenerativeContext: Hashable{
    
    let config : StableDiffusionPipeline.Configuration
    
    let schedulerType : StableDiffusionScheduler
    
    let computeUnits: MLComputeUnits = .cpuAndNeuralEngine
}
