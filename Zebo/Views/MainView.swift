//
//  MainView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("🎨 Color Companion")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                NavigationLink(destination: ContentView()) {
                    Text("📷 Live Camera Analysis")
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                NavigationLink(destination: ColorWheelView(colors: seasonalPalette)) {
                    Text("🧭 Explore Color Wheel")
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.teal.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}
