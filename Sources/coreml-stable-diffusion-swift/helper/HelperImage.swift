//
//  HelperImage.swift
//  
//
//  Created by Igor on 23.03.2023.
//

import Foundation
import SwiftUI

#if os(macOS)

import AppKit

/// Get NSImage from data
/// - Parameters:
///   - data: Data
///   - toSize: Fit to size
/// - Returns: NSImage
@available(macOS 13.1, *)
public func getNSImage(from data : Data?, cropped toSize : NSSize? = nil) async -> NSImage? {

    guard let value = data else{
        return nil
    }
    
    guard let nsImage = NSImage(data: value) else {
        return nil
    }
    
    guard let size = toSize else{
        return nsImage
    }
    
    guard let cropped = nsImage.crop(size: size)else{
                return nil
            }
    
    return cropped
}

/// Get image from CGImage
/// - Parameter cgImage: CGImage
/// - Returns: Image
@available(macOS 13.1, *)
public func getImage(cgImage : CGImage?) -> Image?{
    
    guard let value = cgImage else{
        return nil
    }
        
    let nsImage = NSImage(cgImage: value, size: .init(width: value.width, height: value.height))
    
    return Image(nsImage: nsImage)
}

#endif
