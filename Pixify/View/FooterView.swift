//
//  FooterView.swift
//  Pixify
//
//  Created by Roman Levkovich on 14.06.25.
//

import SwiftUI

struct FooterView: View {

    @Binding var isShowPhotoLibrary: Bool
    var action: () -> Void

    var body: some View {
        HStack (spacing: 40) {
            LibraryButtonView(iconName: "plus.square") {
                isShowPhotoLibrary.toggle()
            }

            Spacer()

            Text("FILTERS")
                .font(.title2)
                .foregroundColor(.black)
                .opacity(0.85)

            Spacer()

            SaveButtonView(iconName: "square.and.arrow.down") {
                action()
            }
        }
        .background(.gray)
    }
}

#Preview {
    FooterView(isShowPhotoLibrary: .constant(false), action: {})
}
