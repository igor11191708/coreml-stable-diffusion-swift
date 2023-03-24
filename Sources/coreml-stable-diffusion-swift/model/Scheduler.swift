//
//  SwiftUIView.swift
//  
//
//  Created by Igor on 24.03.2023.
//

import SwiftUI
import StableDiffusion

@available(iOS 16.2, macOS 13.1, *)
public extension GenerativeManager{
    
    /// Schedulers compatible with StableDiffusionPipeline
    struct Scheduler: Hashable{
        /// Schedulers compatible with StableDiffusionPipeline
        public let type : StableDiffusionScheduler
        ///Name
        public let name : String
        /// Description
        public let description : String
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
    }
    
    /// Default scheduler
    static let defaultScheduler : Scheduler = .init(type: .dpmSolverMultistepScheduler, name: "dpmSolverMultistep", description: "Scheduler that uses a second order DPM-Solver++ algorithm")
    
    /// Set of schedulers
    static let schedulers: [Scheduler] = [
        defaultScheduler,
        .init(type: .pndmScheduler, name: "pndm", description: "Scheduler that uses a pseudo-linear multi-step (PLMS) method")
    ]
    
}
