//
//  ContentView.swift
//  Pixify
//
//  Created by Roman Levkovich on 13.06.25.
//

import SwiftUI

struct ContentView: View {

    @Binding var viewModel: PixifyViewModel
    @State var intensity: Double = 1

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 5) {

                Spacer()

                Image(uiImage: viewModel.filteredImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
                    .contrast(intensity)
                    .padding(.horizontal, 5)
                    .interactiveImageTransform()

                Spacer()

                FilterSlider(value: $intensity) {
                    viewModel.intensity = intensity
                }
                .padding(.bottom, 5)

                VStack(spacing: .zero) {
                    FilterCollectionView(viewModel: $viewModel)

                    Divider()
                        .frame(width: UIScreen.main.bounds.width, height: 5)
                        .background(.gray)
                        .opacity(0.7)

                    FooterView(isShowPhotoLibrary: $viewModel.isShowPhotoLibrary,
                               action: viewModel.saveFilteredImage
                    )
                    .sheet(isPresented: $viewModel.isShowPhotoLibrary) {
                        LibraryView(selectedImage: $viewModel.originalImage)
                    }
                    .alert(viewModel.saveImageResultMessage, isPresented: $viewModel.isShowSaveImageResultAlert) {}
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: UIScreen.main.bounds.width, height: 10)
                        .clipShape(RoundedCorner(radius: 10, corners: [.topLeft, .topRight]))
                        .frame(height: 10)
                        .offset(y: -5)
                        .foregroundColor(.gray),
                    alignment: .top
                )
            }
        }
        .background(.black)
    }
}

#Preview {
    ContentView(viewModel: .constant(PixifyViewModel()))
}
