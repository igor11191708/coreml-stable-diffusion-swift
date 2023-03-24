//
//  URL+.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

internal extension URL {
    
    /// Check is directory
    @available(iOS 16.2, macOS 13.1, *)
    var isDirectory: Bool {
        return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }
}
