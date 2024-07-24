//
//  HelperFile.swift
//  
//
//  Created by Igor on 22.03.2023.
//


import Files
#if canImport(AppKit)
import AppKit
#endif


#if os(macOS)
/// Get list of models from the models directory
/// - Returns: List of model
@available(macOS 13.1, *)
internal func listOfModels() async -> [GenerativeModel] {
    
    guard let docs = Folder.documents,let folder = try? docs.subfolder(at: "models") else{
            return []
       }
    
    return folder.subfolders.map{
        GenerativeModel(url: $0.url, name: $0.name)
    }
}

/// Show the models directory in Finder
@available(macOS 13.1, *)
public func showInFinder() {
    guard let url = Folder.documents?.url else { return }
    
    if url.isDirectory {
        NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: url.path)
    } else {
        NSWorkspace.shared.activateFileViewerSelecting([url])
    }
}

/// Create a folder
/// - Parameter name: Name of the folder to create
/// - Throws: Could not create a folder
@available(macOS 13.1, *)
public func initFolder(name : String) throws{
    if let docs = Folder.documents{
        if docs.containsSubfolder(named: name) == false{
           try docs.createSubfolder(named: name)
        }
    }
}

#endif
