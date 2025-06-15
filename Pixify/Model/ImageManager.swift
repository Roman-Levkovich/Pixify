//
//  ImageManager.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import Foundation
import UIKit

class ImageManager: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?

    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(savePhoto), nil)
    }

    @objc func savePhoto(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfor: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
