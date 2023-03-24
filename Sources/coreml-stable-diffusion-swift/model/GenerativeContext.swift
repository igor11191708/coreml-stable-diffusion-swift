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




