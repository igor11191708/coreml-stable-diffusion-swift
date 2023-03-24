//
//  ProgressState.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

/// Indicates of the current stage of generating images
@available(iOS 16.2, macOS 13.1, *)
public enum ProgressState{
    /// At the begging after app was launched
    case idle
    /// Currently running
    case running
    /// Finished successfully
    case finished
    /// Canceling
    case canceling
    /// Failed with an error
    case failed
}
