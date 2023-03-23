//
//  NSImage+.swift
//  
//
//  Created by Igor on 23.03.2023.
//

import Foundation
import AppKit
/// https://stackoverflow.com/questions/24595908/swift-nsimage-to-cgimage

#if os(macOS)

extension NSImage {
    var CGImage: CGImage {
        get {
            let imageData = self.tiffRepresentation!
            let source = CGImageSourceCreateWithData(imageData as CFData, nil).unsafelyUnwrapped
            let maskRef = CGImageSourceCreateImageAtIndex(source, Int(0), nil)
            return maskRef.unsafelyUnwrapped
        }
    }
}

#endif

