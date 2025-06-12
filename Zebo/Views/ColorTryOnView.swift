//
//  ColorTryOnView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 12/06/25.
//


import SwiftUI

struct ColorTryOnView: View {
    @StateObject var viewModel = SeasonViewModel()

    var body: some View {
        ZStack {
            CameraView(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)

            if let box = viewModel.faceBoundingBox {
                RoundedRectangle(cornerRadius: 24)
                    .fill(viewModel.currentColor)
                    .frame(width: box.width * 1.2, height: box.height * 0.8)
                    .position(x: box.midX, y: box.maxY + box.height * 0.4)
                    .shadow(radius: 5)
            }

            VStack {
                Spacer()

                Text("Color: \(viewModel.currentColorName)")
                    .font(.headline)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .padding(.bottom, 8)

                HStack(spacing: 30) {
                    Button("◀︎") { viewModel.previousColor() }
                    Button("❤️ Save") { viewModel.saveCurrentColor() }
                    Button("▶︎") { viewModel.nextColor() }
                }
                .font(.title2)
                .foregroundColor(.white)
                .padding(.bottom, 40)
            }
        }
    }
}
