//
//  URL+.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

extension URL {
    
    @available(iOS 16.2, macOS 13.1, *)    
    /// Check is directory
    var isDirectory: Bool {
        return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }
}
