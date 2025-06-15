//
//  UIImage+Filter.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import Foundation
import UIKit

extension UIImage {

    func setFilter(_ inputImage: UIImage, _ filter: CIFilter?, _ intensity: Double = 1.0)  -> UIImage {

        let beginImage = CIImage(image: inputImage.orientation())
        let context = CIContext()

        guard let currentFilter = filter else { return  inputImage }

        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)

        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(intensity, forKey: kCIInputIntensityKey)
        }

        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(intensity * 300, forKey: kCIInputRadiusKey)
        }

        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(intensity * 10, forKey: kCIInputScaleKey)
        }

        guard let outputImage = currentFilter.outputImage else { return inputImage  }

        if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImg)
            return uiImage
        }

        return inputImage
    }
}
