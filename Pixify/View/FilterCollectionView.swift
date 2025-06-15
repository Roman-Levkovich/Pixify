//
//  FilterCollectionView.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import SwiftUI

struct FilterCollectionView: View {

    @Binding var viewModel: PixifyViewModel

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.filters, id: \.rawValue) { filter in
                    FilterCollectionViewItem(
                        filterName: filter.rawValue,
                        filteredImage: filter.filterImage(viewModel.originalImage)
                    ) {
                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                            viewModel.isApplyFilter = true
                        }
                        viewModel.applyFilter(selectedFilter: filter.selectedFilter, intensity: viewModel.intensity)
                    }
                }
            }
            .background(.gray)
        }
    }
}

#Preview {
    FilterCollectionView(viewModel: .constant(PixifyViewModel()))
}
