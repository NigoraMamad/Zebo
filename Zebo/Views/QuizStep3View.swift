//
//  QuizStep3View.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI

struct QuizStep3View: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var selectedEyeColor: String = ""

    let eyeColors = ["Blue", "Green", "Hazel", "Brown", "Black", "Gray"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Step 3 of 3")
                .font(.headline)
                .foregroundColor(.gray)

            Text("What's your eye color?")
                .font(.title2)
                .fontWeight(.bold)

            ForEach(eyeColors, id: \.self) { color in
                Button(action: {
                    selectedEyeColor = color
                }) {
                    HStack {
                        Text(color)
                            .foregroundColor(.black)
                        Spacer()
                        if selectedEyeColor == color {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.pink)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 1)
                }
            }

            NavigationLink(
                destination: ResultView(viewModel: viewModel),
                isActive: Binding(
                    get: { !selectedEyeColor.isEmpty },
                    set: { _ in }
                )
            ) {
                Text("See My Season")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedEyeColor.isEmpty ? Color.gray.opacity(0.3) : Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(selectedEyeColor.isEmpty)
        }
        .padding()
        .onDisappear {
            viewModel.eyeColor = selectedEyeColor
        }
    }
}
