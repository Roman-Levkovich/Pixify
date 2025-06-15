//
//  FilterSlider.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import SwiftUI

struct FilterSlider: View {
    @Binding var value: Double
    var onChanged: () -> Void

    var body: some View {
        VStack {
            Slider(value: Binding(
                get: { Double(value) },
                set: { value = Double($0); onChanged() }
            ), in: 0...2)
            .frame(width: UIScreen.main.bounds.width / 3, height: 30, alignment: .center)
        }
        .padding(.horizontal)
    }
}
