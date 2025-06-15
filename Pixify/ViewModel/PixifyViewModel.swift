//
//  PixifyViewModel.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import Foundation
//import UIKit
import SwiftUI

@Observable
class PixifyViewModel {

    var originalImage: UIImage = UIImage(named: "apple") ?? UIImage() {
        didSet {
                filteredImage = originalImage
        }
    }

    var filteredImage: UIImage = UIImage(named: "apple") ?? UIImage()
    
    var filters = Filter.allCases
    
    var intensity: Double = 1
    
    var isSelectedFilter = false

    var isApplyFilter = false

    var isShowSaveImageResultAlert = false

    var saveImageResultMessage : String = ""

    var isShowPhotoLibrary = false

    func applyFilter(selectedFilter: CIFilter? = CIFilter.pixellate(), intensity: Double = 1.0 ) {
        filteredImage = originalImage.setFilter(originalImage, selectedFilter, intensity)
        isApplyFilter = false
    }

    func saveFilteredImage() {
        filteredImage.save { message in
            self.isShowSaveImageResultAlert.toggle()
            self.saveImageResultMessage = message
        }
    }
}
