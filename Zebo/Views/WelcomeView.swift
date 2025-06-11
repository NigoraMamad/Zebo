//
//  WelcomeView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI

struct WelcomeView: View {
  

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Discover Your Glow")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Image(systemName: "paintpalette.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.pink)

                Text("Find the colors that bring out your natural beauty.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                NavigationLink(destination: ContentView()) {
                    Text("Lets Start")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}
