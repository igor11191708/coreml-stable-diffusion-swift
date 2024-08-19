//
//  NSImage+.swift
//  
//
//  Created by Igor on 23.03.2023.
//

import Foundation
#if canImport(AppKit)
import AppKit
#endif

#if os(macOS)

/// https://stackoverflow.com/questions/24595908/swift-nsimage-to-cgimage
@available(macOS 13.1, *)
extension NSImage {
    
    /// Get CGImage from NSImage
   public var CGImage: CGImage? {
        get {
            guard let imageData = self.tiffRepresentation else{
                return nil
            }
            let source = CGImageSourceCreateWithData(imageData as CFData, nil).unsafelyUnwrapped
            let maskRef = CGImageSourceCreateImageAtIndex(source, Int(0), nil)
            return maskRef.unsafelyUnwrapped
        }
    }
}

@available(macOS 13.1, *)
extension NSImage {
    
    /// Returns the height of the current image.
    var height: CGFloat {
        return self.size.height
    }
    
    /// Returns the width of the current image.
    var width: CGFloat {
        return self.size.width
    }
    
    /// Returns a png representation of the current image.
    var PNGRepresentation: Data? {
        if let tiff = self.tiffRepresentation, let tiffData = NSBitmapImageRep(data: tiff) {
            return tiffData.representation(using: .png, properties: [:])
        }
        
        return nil
    }
    
    /// Resizes and crops the image to the specified size.
    /// - Parameter innerSize: The target size to resize and crop the image to.
    /// - Returns: A new `NSImage` object that is resized and cropped to the specified size, or `nil` if the operation fails.
    func resizeAndCrop(to innerSize: NSSize) -> NSImage? {
        let aspectWidth = innerSize.width / self.size.width
        let aspectHeight = innerSize.height / self.size.height
        let aspectRatio = max(aspectWidth, aspectHeight)
        
        let aspectFillSize = NSSize(width: self.size.width * aspectRatio, height: self.size.height * aspectRatio)
        
        guard let resizedImage = self.resize(to: aspectFillSize) else {
            return nil
        }
        
        let croppedImage = resizedImage.crop(to: innerSize)
        
        return croppedImage
    }
    
    /// Resizes the image to the specified size while maintaining the aspect ratio.
    /// - Parameter size: The target size to resize the image to.
    /// - Returns: A new `NSImage` object that is resized to the specified size, or `nil` if the operation fails.
    func resize(to size: NSSize) -> NSImage? {
        let newImage = NSImage(size: size)
        newImage.lockFocus()
        self.draw(in: NSRect(origin: .zero, size: size),
                  from: NSRect(origin: .zero, size: self.size),
                  operation: .copy,
                  fraction: 1.0)
        newImage.unlockFocus()
        return newImage
    }
    
    /// Crops the image to the specified size.
    /// - Parameter size: The target size to crop the image to.
    /// - Returns: A new `NSImage` object that is cropped to the specified size, or `nil` if the operation fails.
    func crop(to size: NSSize) -> NSImage? {
        guard let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
            return nil
        }
        
        let croppingRect = CGRect(x: (cgImage.width - Int(size.width)) / 2,
                                  y: (cgImage.height - Int(size.height)) / 2,
                                  width: Int(size.width),
                                  height: Int(size.height))
        
        guard let croppedCGImage = cgImage.cropping(to: croppingRect) else {
            return nil
        }
        
        let croppedImage = NSImage(cgImage: croppedCGImage, size: size)
        return croppedImage
    }
    
    ///  Saves the PNG representation of the current image to the HD.
    ///
    /// - parameter url: The location url to which to write the png file.
    func savePNGRepresentationToURL(url: URL) throws {
        if let png = self.PNGRepresentation {
            try png.write(to: url, options: .atomicWrite)
        }
    }
}

#endif
