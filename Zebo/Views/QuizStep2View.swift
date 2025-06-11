//
//  QuizStep2View.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI

struct QuizStep2View: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var selectedHairColor: String = ""

    let hairColors = ["Blonde", "Brown", "Black", "Red", "Grey", "Other"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Step 2 of 3")
                .font(.headline)
                .foregroundColor(.gray)

            Text("What's your natural hair color?")
                .font(.title2)
                .fontWeight(.bold)

            ForEach(hairColors, id: \.self) { color in
                Button(action: {
                    selectedHairColor = color
                }) {
                    HStack {
                        Text(color)
                            .foregroundColor(.black)
                        Spacer()
                        if selectedHairColor == color {
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
                destination: QuizStep3View(viewModel: viewModel),
                isActive: Binding(
                    get: { !selectedHairColor.isEmpty },
                    set: { _ in }
                )
            ) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedHairColor.isEmpty ? Color.gray.opacity(0.3) : Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(selectedHairColor.isEmpty)
        }
        .padding()
        .onDisappear {
            viewModel.hairColor = selectedHairColor
        }
    }
}
