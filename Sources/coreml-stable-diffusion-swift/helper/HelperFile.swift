//
//  HelperFile.swift
//  
//
//  Created by Igor on 22.03.2023.
//

import Foundation
import AppKit
import Files
import SwiftUI

@available(iOS 16.2, macOS 13.1, *)
public func listOfModels() async -> [GenerativeModel] {
    
    guard let docs = Folder.documents,let folder = try? docs.subfolder(at: "models") else{
            return []
       }
    
    return folder.subfolders.map{
        GenerativeModel(url: $0.url, name: $0.name)
    }
}

@available(iOS 16.2, macOS 13.1, *)
public func showInFinder() {
    guard let url = Folder.documents?.url else { return }
    
    if url.isDirectory {
        NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: url.path)
    } else {
        NSWorkspace.shared.activateFileViewerSelecting([url])
    }
}

@available(iOS 16.2, macOS 13.1, *)
public func initFolder(name : String) throws{
    if let docs = Folder.documents{
        if docs.containsSubfolder(named: name) == false{
           try docs.createSubfolder(named: name)
        }
    }
}

#if os(macOS)
public func getImage(from data : Data) -> Image?{
    guard let nsImage = NSImage(data: data) else {
        return nil
    }
    
    return Image(nsImage: nsImage)
}
#endif

@ViewBuilder
@available(iOS 16.2, macOS 13.1, *)
public func emptyImageTpl(width: CGFloat? = nil, height: CGFloat? = nil, systemName: String = "photo" ) -> some View{
    Image(systemName: systemName)
        .resizable()
        .scaledToFit()
        .frame(width: width, height: height)
}
