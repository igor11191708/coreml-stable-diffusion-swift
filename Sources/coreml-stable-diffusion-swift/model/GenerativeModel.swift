//
//  GenerativeModel.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

/// Model  profile description
@available(iOS 16.0, macOS 13.1, *)
public struct GenerativeModel: Hashable, Identifiable{
    
    // MARK: - Life circle
    public init(url: URL? = nil, name: String) {
        self.url = url
        self.name = name
    }
    
    /// Identifier
    public let id = UUID()
    
    /// The path to the models files
    public let url: URL?
        
    /// Name of the model
    public let name: String
    
}
