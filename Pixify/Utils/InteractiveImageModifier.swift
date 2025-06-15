//
//  InteractiveImageModifier.swift
//  Pixify
//
//  Created by Roman Levkovich on 15.06.25.
//

import SwiftUI

struct InteractiveImageModifier: ViewModifier {

    let minScale: CGFloat
    let maxScale: CGFloat

    @State private var currentScale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    @State private var currentRotation: Angle = .zero
    @State private var lastRotation: Angle = .zero

    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    func body(content: Content) -> some View {
        let drag = DragGesture()
            .onChanged { value in
                offset = CGSize(
                    width: lastOffset.width + value.translation.width,
                    height: lastOffset.height + value.translation.height
                )
            }
            .onEnded { _ in
                lastOffset = offset
            }

        let magnify = MagnificationGesture()
            .onChanged { value in
                let newScale = lastScale * value
                currentScale = min(max(newScale, minScale), maxScale)
            }
            .onEnded { _ in
                lastScale = currentScale
            }

        let rotate = RotationGesture()
            .onChanged { angle in
                currentRotation = lastRotation + angle
            }
            .onEnded { _ in
                lastRotation = currentRotation
            }

        let combined = drag
            .simultaneously(with: magnify)
            .simultaneously(with: rotate)

        return content
            .scaleEffect(currentScale)
            .rotationEffect(currentRotation)
            .offset(offset)
            .gesture(combined)
            .animation(.easeInOut(duration: 0.2), value: currentScale)
            .animation(.easeInOut(duration: 0.2), value: offset)
            .animation(.easeInOut(duration: 0.2), value: currentRotation)
    }
}
