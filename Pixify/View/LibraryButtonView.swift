//
//  LibraryButtonView.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import SwiftUI

struct LibraryButtonView: View {
    let iconName : String
    let clickOnLibrary: () -> Void
    
    var body: some View {
        Button {
            clickOnLibrary()
        } label: {
            Image(systemName: iconName)
                .font(.title)
                .foregroundColor(.white)
                .background(.gray)
        }
    }
}

#Preview {
    LibraryButtonView(iconName: "plus.square", clickOnLibrary: {})
}
