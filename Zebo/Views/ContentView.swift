//
//  ContentView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SeasonViewModel()
    
    let seasonalPalettes: [String: [Color]] = [
        "Spring": [Color(hex: "#F7C59F"), Color(hex: "#FFD166"), Color(hex: "#9AE19D"), Color(hex: "#ADD8E6")],
        "Summer": [Color(hex: "#E6CCFF"), Color(hex: "#FFC0CB"), Color(hex: "#87CEFA"), Color(hex: "#B0C4DE")],
        "Autumn": [Color(hex: "#C68E17"), Color(hex: "#8B4513"), Color(hex: "#D2691E"), Color(hex: "#F4A460")],
        "Winter": [Color(hex: "#000000"), Color(hex: "#E0FFFF"), Color(hex: "#FFFFFF"), Color(hex: "#DC143C")]
    ]



    var body: some View {
           ZStack(alignment: .top) {
               CameraView(viewModel: viewModel)
                   .edgesIgnoringSafeArea(.all)

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
               }
               .padding()
           }
       }
   }
