//
//  ColorWheelView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//

import SwiftUI

struct ColorWheelView: View {
    let colors: [SeasonalColor]

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(Array(colors.enumerated()), id: \.1.id) { index, seasonalColor in
                    let angle = Double(index) / Double(colors.count) * 2 * .pi
                    let radius = geo.size.width / 2.5
                    let x = cos(angle) * radius
                    let y = sin(angle) * radius

                    Circle()
                        .fill(seasonalColor.color)
                        .frame(width: 40, height: 40)
                        .position(x: geo.size.width / 2 + CGFloat(x),
                                  y: geo.size.height / 2 + CGFloat(y))
                        .onTapGesture {
                            print("Tapped \(seasonalColor.name)")
                        }
                        .shadow(radius: 2)
                }
            }
        }
        .frame(height: 300)
    }
}
