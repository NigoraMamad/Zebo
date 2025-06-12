//
//  ColorWheelView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//

import SwiftUI

import SwiftUI

struct ColorWheelView: View {
    let colors: [SeasonalColor]
    @State private var selectedColor: SeasonalColor?

    var body: some View {
        VStack(spacing: 20) {
            Text("Tap a Color to Preview")
                .font(.title2)
                .bold()

            GeometryReader { geo in
                ZStack {
                    ForEach(Array(colors.enumerated()), id: \.1.id) { index, color in
                        let angle = Double(index) / Double(colors.count) * 2 * .pi
                        let radius = geo.size.width / 2.8
                        let x = cos(angle) * radius
                        let y = sin(angle) * radius

                        Circle()
                            .fill(color.color)
                            .frame(width: 40, height: 40)
                            .position(x: geo.size.width / 2 + CGFloat(x),
                                      y: geo.size.height / 2 + CGFloat(y))
                            .onTapGesture {
                                selectedColor = color
                            }
                            .shadow(radius: 2)
                    }
                }
            }
            .frame(height: 300)

            if let color = selectedColor {
                VStack(spacing: 8) {
                    Text("Selected: \(color.name)")
                        .font(.headline)
                    Rectangle()
                        .fill(color.color)
                        .frame(height: 100)
                        .cornerRadius(16)
                        .shadow(radius: 3)
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }
}
