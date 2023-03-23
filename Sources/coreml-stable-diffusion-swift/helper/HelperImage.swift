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

@available(macOS 13.1, *)
public func getImage(from data : Data?, cropped toSize : NSSize? = nil) async -> Image?{
    
    guard let nsImage = await getNSImage(from: data, cropped: toSize) else{ return nil }
    
    return Image(nsImage: nsImage)
}

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

public func getImage(cgImage : CGImage?) -> Image?{
    
    guard let value = cgImage else{
        return nil
    }
        
    let nsImage = NSImage(cgImage: value, size: .init(width: value.width, height: value.height))
    
    return Image(nsImage: nsImage)
}

@available(macOS 13.1, *)
func getCGImage(from data : Data) -> CGImage?{
    NSImage(data: data)?.CGImage
}

#endif

#if os(iOS)

import UIKit

@available(iOS 16.2, *)
public func getImage(from data : Data) -> Image?{
    guard let uiImage = UIImage(data: data) else {
        return nil
    }
    
    return Image(uiImage: uiImage)
}

@available(iOS 16.2, *)
func getCGImage(from data : Data) -> CGImage?{
    // TODO: omplement
    return nil
}
#endif
