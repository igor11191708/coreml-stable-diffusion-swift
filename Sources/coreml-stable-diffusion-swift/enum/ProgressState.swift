//
//  ProgressState.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

@available(iOS 16.2, macOS 13.1, *)
/// Indicates of the current stage of generating images
public enum ProgressState{
    /// At the begging after app was launched
    case idle
    /// Currently running
    case running
    /// Finished successfully
    case finished
    /// Canceled
    case canceled
    /// Failed with an error
    case failed
}
