//
//  View+InteractiveImageTransform.swift
//  Pixify
//
//  Created by Roman Levkovich on 15.06.25.
//

import SwiftUI

extension View {
    func interactiveImageTransform(minScale: CGFloat = 0.5, maxScale: CGFloat = 2.0) -> some View {
        modifier(InteractiveImageModifier(minScale: minScale, maxScale: maxScale))
    }
}
