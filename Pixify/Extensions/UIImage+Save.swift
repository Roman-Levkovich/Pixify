//
//  UIImage+Save.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import Foundation
import UIKit

extension UIImage {
    func save(withCompletionHandler: @escaping (String) -> Void) {
        let imageManager = ImageManager()

        imageManager.successHandler = {
            withCompletionHandler("Успешно сохраненно")
        }

        imageManager.errorHandler =  {
            withCompletionHandler("Ошибка сохранения \($0.localizedDescription)")
        }

        imageManager.writeToPhotoAlbum(image: self)
    }
}
