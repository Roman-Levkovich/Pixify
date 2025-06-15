//
//  FilterCollectionViewItem.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import SwiftUI

struct FilterCollectionViewItem: View {
    var filterName: String
    var filteredImage: UIImage?
    var clickOnFilter: () -> Void
    
    var body: some View {
        Button {
            clickOnFilter()
        } label: {
            VStack(spacing: .zero) {
                if let image = filteredImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } else {
                    ProgressView()
                        .frame(width: 80, height: 120)
                }
    
                Text(filterName)
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .frame(width: 80, height: 50, alignment: .top)
            }
            .background(.clear)
        }
        .padding([.horizontal, .top], 10)
    }
}

#Preview {
    FilterCollectionViewItem(
        filterName: "FilterName",
        filteredImage: UIImage(named: "apple"),
        clickOnFilter: {}
    )
    .padding()
}
