//
//  ContentView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SeasonViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            CameraView(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)

            // 👕 Virtual t-shirt overlay under the face
            if let box = viewModel.faceBoundingBox {
                RoundedRectangle(cornerRadius: 20)
                    .fill(viewModel.currentColor)
                    .frame(width: box.width * 1.2, height: box.height * 0.8)
                    .position(x: box.midX, y: box.maxY + box.height * 0.4)
                    .shadow(radius: 5)
            }

            // 🌈 Season text and palette overlay
            VStack(spacing: 16) {
                Text("You are a")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 60)

                Text(viewModel.detectedSeason)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 5)

                if let palette = seasonalPalettes[viewModel.detectedSeason] {
                    HStack(spacing: 12) {
                        ForEach(palette, id: \.self) { color in
                            color
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.top, 10)
                }

                // 🕹️ Optional: Add next/previous/save buttons here later
            }
            .padding()
        }
    }
}
