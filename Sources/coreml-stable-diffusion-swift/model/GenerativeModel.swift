//
//  GenerativeModel.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation

@available(iOS 16.2, macOS 13.1, *)
public struct GenerativeModel: Hashable, Identifiable{
    
    public init(url: URL? = nil, name: String) {
        self.url = url
        self.name = name
    }
    
    
    public let id = UUID()
    
    public let url: URL?
    
    public let name: String
    
}
