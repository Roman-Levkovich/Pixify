//
//  SaveButtonView.swift
//  Pixify
//
//  Created by Roman Levkovich on 14.06.25.
//

import SwiftUI

struct SaveButtonView: View {
    let iconName : String
    let clickToSave: () -> Void
    
    var body: some View {
        Button {
            clickToSave()
        } label: {
            Image(systemName: iconName)
                .font(.title)
                .foregroundColor(.white)
                .background(.gray)
        }
    }
}

#Preview {
    SaveButtonView(iconName: "square.and.arrow.down", clickToSave: {})
}
