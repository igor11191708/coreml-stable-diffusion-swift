//
//  HelperFile.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import AppKit
import Files

#if os(macOS)

@available(macOS 13.1, *)
/// Get list of models from the models directory
/// - Returns: List of model
internal func listOfModels() async -> [GenerativeModel] {
    
    guard let docs = Folder.documents,let folder = try? docs.subfolder(at: "models") else{
            return []
       }
    
    return folder.subfolders.map{
        GenerativeModel(url: $0.url, name: $0.name)
    }
}

@available(macOS 13.1, *)
/// Show the models directory in Finder
public func showInFinder() {
    guard let url = Folder.documents?.url else { return }
    
    if url.isDirectory {
        NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: url.path)
    } else {
        NSWorkspace.shared.activateFileViewerSelecting([url])
    }
}

@available(macOS 13.1, *)
/// Create a folder
/// - Parameter name: Name of the folder to create
/// - Throws: Could not create a folder
public func initFolder(name : String) throws{
    if let docs = Folder.documents{
        if docs.containsSubfolder(named: name) == false{
           try docs.createSubfolder(named: name)
        }
    }
}

#endif
