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


let springPalette: [SeasonalColor] = [
    .init(name: "Butter Yellow", color: Color(hex: "#F8E473"), hex: "#F8E473", season: "Spring"),
    .init(name: "Coral Peach", color: Color(hex: "#FFB387"), hex: "#FFB387", season: "Spring"),
    .init(name: "Warm Apricot", color: Color(hex: "#F6A87B"), hex: "#F6A87B", season: "Spring"),
    .init(name: "Leaf Green", color: Color(hex: "#A8D47F"), hex: "#A8D47F", season: "Spring"),
    .init(name: "Sky Blue", color: Color(hex: "#B0DDF5"), hex: "#B0DDF5", season: "Spring"),
    .init(name: "Bright Aqua", color: Color(hex: "#58E2E8"), hex: "#58E2E8", season: "Spring"),
    .init(name: "Warm Pink", color: Color(hex: "#F7A1B1"), hex: "#F7A1B1", season: "Spring"),
    .init(name: "Cream", color: Color(hex: "#FFF8D6"), hex: "#FFF8D6", season: "Spring"),
    .init(name: "Golden Beige", color: Color(hex: "#F1D09F"), hex: "#F1D09F", season: "Spring"),
    .init(name: "Fresh Mint", color: Color(hex: "#A0E6C3"), hex: "#A0E6C3", season: "Spring"),
    .init(name: "Sunflower", color: Color(hex: "#FFDE59"), hex: "#FFDE59", season: "Spring"),
    .init(name: "Melon", color: Color(hex: "#FFBC9A"), hex: "#FFBC9A", season: "Spring"),
    .init(name: "Light Coral", color: Color(hex: "#F4A896"), hex: "#F4A896", season: "Spring"),
    .init(name: "Light Turquoise", color: Color(hex: "#93E9E1"), hex: "#93E9E1", season: "Spring"),
    .init(name: "Goldenrod", color: Color(hex: "#F4B400"), hex: "#F4B400", season: "Spring"),
    .init(name: "Blush", color: Color(hex: "#FDD6D6"), hex: "#FDD6D6", season: "Spring"),
    .init(name: "Pastel Green", color: Color(hex: "#C7E5C8"), hex: "#C7E5C8", season: "Spring"),
    .init(name: "Banana Cream", color: Color(hex: "#FFF4B1"), hex: "#FFF4B1", season: "Spring"),
    .init(name: "Bright Rose", color: Color(hex: "#FF6F91"), hex: "#FF6F91", season: "Spring"),
    .init(name: "Light Periwinkle", color: Color(hex: "#C3DAFF"), hex: "#C3DAFF", season: "Spring")
]

let summerPalette: [SeasonalColor] = [
    .init(name: "Soft Lavender", color: Color(hex: "#C8BFE7"), hex: "#C8BFE7", season: "Summer"),
    .init(name: "Cool Rose", color: Color(hex: "#F7B1C4"), hex: "#F7B1C4", season: "Summer"),
    .init(name: "Misty Blue", color: Color(hex: "#B3D4E0"), hex: "#B3D4E0", season: "Summer"),
    .init(name: "Dusty Lilac", color: Color(hex: "#BAA7CC"), hex: "#BAA7CC", season: "Summer"),
    .init(name: "Cloud Gray", color: Color(hex: "#D6D9DC"), hex: "#D6D9DC", season: "Summer"),
    .init(name: "Powder Blue", color: Color(hex: "#B0C5E3"), hex: "#B0C5E3", season: "Summer"),
    .init(name: "Rose Quartz", color: Color(hex: "#F7C5C5"), hex: "#F7C5C5", season: "Summer"),
    .init(name: "Seafoam", color: Color(hex: "#A0D6C7"), hex: "#A0D6C7", season: "Summer"),
    .init(name: "Sky Gray", color: Color(hex: "#CED9E0"), hex: "#CED9E0", season: "Summer"),
    .init(name: "Soft Teal", color: Color(hex: "#8FD6D6"), hex: "#8FD6D6", season: "Summer"),
    .init(name: "Cool Mauve", color: Color(hex: "#D9B2C2"), hex: "#D9B2C2", season: "Summer"),
    .init(name: "Slate Blue", color: Color(hex: "#9FB8D3"), hex: "#9FB8D3", season: "Summer"),
    .init(name: "Heather", color: Color(hex: "#CAB7D2"), hex: "#CAB7D2", season: "Summer"),
    .init(name: "Dusty Pink", color: Color(hex: "#E4A7B1"), hex: "#E4A7B1", season: "Summer"),
    .init(name: "Muted Coral", color: Color(hex: "#F7BFB2"), hex: "#F7BFB2", season: "Summer"),
    .init(name: "Iced Lavender", color: Color(hex: "#E3D9F7"), hex: "#E3D9F7", season: "Summer"),
    .init(name: "Soft Navy", color: Color(hex: "#728CA3"), hex: "#728CA3", season: "Summer"),
    .init(name: "Pale Rose", color: Color(hex: "#FFE6E6"), hex: "#FFE6E6", season: "Summer"),
    .init(name: "Icy Lilac", color: Color(hex: "#EDE2F7"), hex: "#EDE2F7", season: "Summer"),
    .init(name: "Pastel Denim", color: Color(hex: "#A4C2E0"), hex: "#A4C2E0", season: "Summer")
]

let autumnPalette: [SeasonalColor] = [
    .init(name: "Rust", color: Color(hex: "#B7410E"), hex: "#B7410E", season: "Autumn"),
    .init(name: "Burnt Orange", color: Color(hex: "#CC5500"), hex: "#CC5500", season: "Autumn"),
    .init(name: "Olive Green", color: Color(hex: "#708238"), hex: "#708238", season: "Autumn"),
    .init(name: "Mustard", color: Color(hex: "#D4A017"), hex: "#D4A017", season: "Autumn"),
    .init(name: "Terracotta", color: Color(hex: "#E2725B"), hex: "#E2725B", season: "Autumn"),
    .init(name: "Warm Taupe", color: Color(hex: "#D2B48C"), hex: "#D2B48C", season: "Autumn"),
    .init(name: "Camel", color: Color(hex: "#C19A6B"), hex: "#C19A6B", season: "Autumn"),
    .init(name: "Copper", color: Color(hex: "#B87333"), hex: "#B87333", season: "Autumn"),
    .init(name: "Khaki", color: Color(hex: "#C3B091"), hex: "#C3B091", season: "Autumn"),
    .init(name: "Pumpkin", color: Color(hex: "#FF7518"), hex: "#FF7518", season: "Autumn"),
    .init(name: "Deep Moss", color: Color(hex: "#556B2F"), hex: "#556B2F", season: "Autumn"),
    .init(name: "Mahogany", color: Color(hex: "#C04000"), hex: "#C04000", season: "Autumn"),
    .init(name: "Golden Olive", color: Color(hex: "#A7893E"), hex: "#A7893E", season: "Autumn"),
    .init(name: "Brick", color: Color(hex: "#A14A3F"), hex: "#A14A3F", season: "Autumn"),
    .init(name: "Spice", color: Color(hex: "#E97451"), hex: "#E97451", season: "Autumn"),
    .init(name: "Warm Forest", color: Color(hex: "#228B22"), hex: "#228B22", season: "Autumn"),
    .init(name: "Dark Caramel", color: Color(hex: "#8B5A2B"), hex: "#8B5A2B", season: "Autumn"),
    .init(name: "Ochre", color: Color(hex: "#CC7722"), hex: "#CC7722", season: "Autumn"),
    .init(name: "Auburn", color: Color(hex: "#A52A2A"), hex: "#A52A2A", season: "Autumn"),
    .init(name: "Maple", color: Color(hex: "#D2691E"), hex: "#D2691E", season: "Autumn")
]

let winterPalette: [SeasonalColor] = [
    .init(name: "Crimson", color: Color(hex: "#DC143C"), hex: "#DC143C", season: "Winter"),
    .init(name: "Royal Blue", color: Color(hex: "#4169E1"), hex: "#4169E1", season: "Winter"),
    .init(name: "Icy Blue", color: Color(hex: "#D6ECF2"), hex: "#D6ECF2", season: "Winter"),
    .init(name: "Cool Pink", color: Color(hex: "#FF6FFF"), hex: "#FF6FFF", season: "Winter"),
    .init(name: "Black", color: Color(hex: "#000000"), hex: "#000000", season: "Winter"),
    .init(name: "Snow White", color: Color(hex: "#FAFAFA"), hex: "#FAFAFA", season: "Winter"),
    .init(name: "Plum", color: Color(hex: "#8E4585"), hex: "#8E4585", season: "Winter"),
    .init(name: "Cool Gray", color: Color(hex: "#B0BFC6"), hex: "#B0BFC6", season: "Winter"),
    .init(name: "Deep Teal", color: Color(hex: "#006D77"), hex: "#006D77", season: "Winter"),
    .init(name: "Sapphire", color: Color(hex: "#0F52BA"), hex: "#0F52BA", season: "Winter"),
    .init(name: "Electric Blue", color: Color(hex: "#7DF9FF"), hex: "#7DF9FF", season: "Winter"),
    .init(name: "Charcoal", color: Color(hex: "#36454F"), hex: "#36454F", season: "Winter"),
    .init(name: "Berry", color: Color(hex: "#8A2BE2"), hex: "#8A2BE2", season: "Winter"),
    .init(name: "True Red", color: Color(hex: "#FF0000"), hex: "#FF0000", season: "Winter"),
    .init(name: "Emerald", color: Color(hex: "#50C878"), hex: "#50C878", season: "Winter"),
    .init(name: "Icy Lilac", color: Color(hex: "#E1D6F7"), hex: "#E1D6F7", season: "Winter"),
    .init(name: "Silver", color: Color(hex: "#C0C0C0"), hex: "#C0C0C0", season: "Winter"),
    .init(name: "Jet Blue", color: Color(hex: "#0A1D37"), hex: "#0A1D37", season: "Winter"),
    .init(name: "Deep Fuchsia", color: Color(hex: "#C154C1"), hex: "#C154C1", season: "Winter"),
    .init(name: "Magenta", color: Color(hex: "#FF00FF"), hex: "#FF00FF", season: "Winter")
]

let seasonalPalette: [SeasonalColor] = springPalette + summerPalette + autumnPalette + winterPalette
