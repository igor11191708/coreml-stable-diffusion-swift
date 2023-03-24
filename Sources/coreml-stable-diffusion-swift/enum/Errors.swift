//
//  Errors.swift
//  
//
//  Created by Igor on 24.03.2023.
//

import Foundation

/// Set of errors for generating images process for the current package
@available(iOS 16.2, macOS 13.1, *)
public enum Errors : Error{
    /// Pipeline is not defined
    case pipelineIsNotDefined
}
