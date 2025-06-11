//
//  PaletteExplorerView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI

struct PaletteExplorerView: View {
    @State private var selectedSeason = "Spring"

    let seasons = ["Spring", "Summer", "Autumn", "Winter"]
    
    let paletteColors: [String: [String]] = [
        "Spring": ["peach", "CoralPink", "mint", "skyBlue"],
        "Summer": ["lavender", "rose", "coolBlue", "softGray"],
        "Autumn": ["BurntOrange", "olive", "warmBrown", "beige"],
        "Winter": ["crimson", "black", "icyBlue", "white"]
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Explore Seasonal Palettes")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Picker("Season", selection: $selectedSeason) {
                ForEach(seasons, id: \.self) { season in
                    Text(season).tag(season)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(paletteColors[selectedSeason] ?? [], id: \.self) { colorName in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(colorName))
                            .frame(width: 80, height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                }
                .padding()
            }

            Spacer()
        }
        .navigationTitle("Palette Explorer")
        .navigationBarTitleDisplayMode(.inline)
    }
}
