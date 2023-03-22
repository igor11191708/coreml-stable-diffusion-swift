//
//  URL+.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

extension URL {
    var isDirectory: Bool {
        return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }
}
