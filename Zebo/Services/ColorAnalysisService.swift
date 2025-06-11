//
//  ColorAnalysisService.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import UIKit

class ColorAnalysisService {
    
    /// Converts UIColor to RGB components
    private func getRGB(from color: UIColor) -> (r: CGFloat, g: CGFloat, b: CGFloat)? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        if color.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r, g, b)
        } else {
            return nil
        }
    }

    /// Main method to detect season
    func detectSeason(from color: UIColor) -> String {
        guard let rgb = getRGB(from: color) else { return "Unknown" }

        let red = rgb.r
        let green = rgb.g
        let blue = rgb.b

        // 1. Warm or Cool
        let undertone: String
        if red > blue && green > blue {
            undertone = "Warm"
        } else if blue > red && blue > green {
            undertone = "Cool"
        } else {
            undertone = "Neutral"
        }

        // 2. Light or Deep
        let brightness = (red + green + blue) / 3.0
        let depth = brightness > 0.65 ? "Light" : "Deep"

        // 3. Final season classification
        switch (undertone, depth) {
        case ("Warm", "Light"):
            return "Spring"
        case ("Warm", "Deep"):
            return "Autumn"
        case ("Cool", "Light"):
            return "Summer"
        case ("Cool", "Deep"):
            return "Winter"
        default:
            return "Soft Autumn or Soft Summer"
        }
    }
}
