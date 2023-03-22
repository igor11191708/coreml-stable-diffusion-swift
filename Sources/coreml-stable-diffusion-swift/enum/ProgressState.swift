//
//  ProgressState.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

@available(iOS 16.2, macOS 13.1, *)
enum ProgressState{

    case idle
    
    case start
    
    case running
    
    case finished
    
    case canceled
    
    case failed
    
}
