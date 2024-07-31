//
//  HelperImage.swift
//  
//
//  Created by Igor on 23.03.2023.
//

import Foundation
import SwiftUI
#if canImport(AppKit)
import AppKit
#endif

#if os(macOS)
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
    
    guard let size = toSize ?? adjustSize(for: nsImage) else{
        return nsImage
    }
    
    guard let cropped = nsImage.resizeAndCrop(to: size)else{
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

/// Determines the largest square size from a predefined set of sizes that can fit within the given image's dimensions.
/// - Parameter image: The input `NSImage` to be adjusted.
/// - Returns: An `NSSize` representing the largest possible square size that fits within the image's dimensions, or `nil` if the image is too small.
@available(macOS 13.1, *)
func adjustSize(for image: NSImage) -> NSSize? {
    let predefinedSizes: [CGFloat] = [512]
    
    let width = image.size.width
    let height = image.size.height
    
    guard width >= 256, height >= 256 else {
        return nil
    }
    
    let minDimension = min(width, height)
    
    // Find the largest predefined size that can fit within the image dimensions
    for size in predefinedSizes.reversed() {
        if minDimension >= size {
            return NSSize(width: size, height: size)
        }
    }
    
    return nil
}

#endif
