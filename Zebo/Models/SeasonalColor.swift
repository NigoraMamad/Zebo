//
//  SeasonalColor.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//

import SwiftUI

struct SeasonalColor: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
    let hex: String
    let season: String
}

let seasonalPalettes: [String: [Color]] = [
    "Spring": [Color(hex: "#F7C59F"), Color(hex: "#FFD166"), Color(hex: "#9AE19D"), Color(hex: "#ADD8E6")],
    "Summer": [Color(hex: "#E6CCFF"), Color(hex: "#FFC0CB"), Color(hex: "#87CEFA"), Color(hex: "#B0C4DE")],
    "Autumn": [Color(hex: "#C68E17"), Color(hex: "#8B4513"), Color(hex: "#D2691E"), Color(hex: "#F4A460")],
    "Winter": [Color(hex: "#000000"), Color(hex: "#E0FFFF"), Color(hex: "#FFFFFF"), Color(hex: "#DC143C")]
]


let seasonalPalette: [SeasonalColor] = [
    SeasonalColor(name: "Butter Yellow", color: Color(hex: "#F8E473"), hex: "#F8E473", season: "Spring"),
    SeasonalColor(name: "Sky Blue", color: Color(hex: "#ADD8E6"), hex: "#ADD8E6", season: "Summer"),
    SeasonalColor(name: "Olive", color: Color(hex: "#708238"), hex: "#708238", season: "Autumn"),
    SeasonalColor(name: "Icy Blue", color: Color(hex: "#D6ECF2"), hex: "#D6ECF2", season: "Winter"),
    // Add more colors...
]
