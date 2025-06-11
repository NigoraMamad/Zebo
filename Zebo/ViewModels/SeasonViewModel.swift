//
//  SeasonViewModel.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import SwiftUI

class SeasonViewModel: ObservableObject {
    @Published var detectedSeason: String = "Analyzing..."
    @Published var faceBoundingBox: CGRect? = nil  // ← for t-shirt overlay
    
    // New for t-shirt color preview
    @Published var currentColorIndex: Int = 0
    @Published var savedColors: [SeasonalColor] = []

    /// Update the season label when CoreML classifies it
    func updateSeason(to season: String) {
        DispatchQueue.main.async {
            self.detectedSeason = season
            self.currentColorIndex = 0  // reset preview when season changes
        }
    }

    /// Preview colors (4 or more) for the detected season
    var previewColors: [SeasonalColor] {
        seasonalPalette.filter { $0.season == detectedSeason }
    }

    /// Current color in preview
    var currentColor: Color {
        guard !previewColors.isEmpty else { return .gray }
        return previewColors[currentColorIndex % previewColors.count].color
    }

    /// Name of current color
    var currentColorName: String {
        guard !previewColors.isEmpty else { return "Unknown" }
        return previewColors[currentColorIndex % previewColors.count].name
    }

    /// Move to next color in preview
    func nextColor() {
        currentColorIndex += 1
    }

    /// Move to previous color in preview
    func previousColor() {
        currentColorIndex = (currentColorIndex - 1 + previewColors.count) % previewColors.count
    }

    /// Save selected color if not already saved
    func saveCurrentColor() {
        let colorToSave = previewColors[currentColorIndex % previewColors.count]
        if !savedColors.contains(where: { $0.hex == colorToSave.hex }) {
            savedColors.append(colorToSave)
        }
    }
}
