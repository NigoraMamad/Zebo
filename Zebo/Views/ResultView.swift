//
//  ResultView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: QuizViewModel

    // Dummy color palettes for each season
    let palettes: [String: [Color]] = [
        "Spring": [.coralPink, .peach, .mint, .skyBlue],
        "Summer": [.lavender, .rose, .coolBlue, .softGray],
        "Autumn": [.burntOrange, .olive, .warmBrown, .beige],
        "Winter": [.crimson, .black, .icyBlue, .white]
    ]

    var body: some View {
        let season = viewModel.resultSeason
        let colors = palettes[season] ?? [.gray, .gray, .gray]

        VStack(spacing: 25) {
            Text("You're a \(season)!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Image(systemName: "leaf.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundColor(.pink)

            Text(description(for: season))
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Text("Your Palette")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                        .frame(width: 60, height: 60)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                }
            }

            Spacer()

            NavigationLink(destination: PaletteExplorerView()) {
                Text("Explore More Palettes")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

        }
        .padding()
    }

    func description(for season: String) -> String {
        switch season {
        case "Spring":
            return "Bright and warm colors bring out your natural glow. Think peach, coral, and soft yellow."
        case "Summer":
            return "Cool and muted tones suit you best — like lavender, rose, and soft gray."
        case "Autumn":
            return "Warm, earthy tones like olive, burnt orange, and golden brown complement you beautifully."
        case "Winter":
            return "High contrast and bold colors like crimson, icy blue, and black enhance your features."
        default:
            return "Your personal color season helps you choose colors that enhance your natural beauty."
        }
    }
}
