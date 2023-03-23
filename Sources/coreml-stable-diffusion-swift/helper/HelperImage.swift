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
public func getImage(from data : Data?) -> Image?{
    
    guard let value = data else{
        return nil
    }
    
    guard let nsImage = NSImage(data: value) else {
        return nil
    }
    
    return Image(nsImage: nsImage)
}

public func getImage(cgImage : CGImage?) -> Image?{
    
    guard let value = cgImage else{
        return nil
    }
    
    let nsImage = NSImage(cgImage: value, size: .init(width: 512, height: 512))
    
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
