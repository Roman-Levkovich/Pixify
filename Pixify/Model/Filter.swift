//
//  Filter.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import Foundation
import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

enum Filter : String, CaseIterable {
    case original = "Original"
    case colorInvert = "Color Invert"
    case photoEffectMono = "Effect Mono"
    case pixellate = "Pixellate"
    case sharpenLuminance = "Sharpen Luminance"
    case vignette = "Vignette"
    case sepiaTone = "Sepia Tone"
    case photoEffectInstant = "Effect Instant"
    case colorMonochrome = "Color Monochrome"
    case unsharpMask = "Unsharp Mask"

    var selectedFilter: CIFilter? {
        switch self {
        case .original:
            return nil
        case .colorInvert:
            return CIFilter.colorInvert()
        case .photoEffectMono:
            return CIFilter.photoEffectMono()
        case .pixellate:
            return CIFilter.pixellate()
        case .sharpenLuminance:
            return CIFilter.sharpenLuminance()
        case .vignette:
            return CIFilter.vignette()
        case .sepiaTone:
            return CIFilter.sepiaTone()
        case .photoEffectInstant:
            return CIFilter.photoEffectInstant()
        case .colorMonochrome:
            return CIFilter.colorMonochrome()
        case .unsharpMask:
            return CIFilter.unsharpMask()
        }
    }

    func filterImage(_ image: UIImage) -> UIImage {
        switch self {
        case .original:
            return image
        case .colorInvert:
            return  image.setFilter(image, selectedFilter)
        case .photoEffectMono:
            return image.setFilter(image, selectedFilter)
        case .pixellate:
            return  image.setFilter(image, selectedFilter)
        case .sharpenLuminance:
            return  image.setFilter(image, selectedFilter)
        case .vignette:
            return  image.setFilter(image, selectedFilter)
        case .sepiaTone:
            return  image.setFilter(image, selectedFilter)
        case .photoEffectInstant:
            return  image.setFilter(image, selectedFilter)
        case .colorMonochrome:
            return  image.setFilter(image, selectedFilter)
        case .unsharpMask:
            return  image.setFilter(image, selectedFilter)
        }
    }
}
