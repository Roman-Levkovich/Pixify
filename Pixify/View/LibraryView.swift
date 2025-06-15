//
//  LibraryView.swift
//  Pixify
//
//  Created by Roman Levkovich on 14.06.25.
//

import Foundation
import SwiftUI
import UIKit

struct LibraryView: UIViewControllerRepresentable {

    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imgPicker = UIImagePickerController()
        imgPicker.allowsEditing = false
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = context.coordinator
        return imgPicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: LibraryView
        
        init(_ parent: LibraryView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

