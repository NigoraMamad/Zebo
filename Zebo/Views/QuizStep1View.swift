//
//  QuizStep1View.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI

struct QuizStep1View: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var selectedTone: String = ""

    let skinTones = ["Fair", "Light", "Medium", "Olive", "Deep"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Step 1 of 3")
                .font(.headline)
                .foregroundColor(.gray)

            Text("What's your skin tone?")
                .font(.title2)
                .fontWeight(.bold)

            ForEach(skinTones, id: \.self) { tone in
                Button(action: {
                    selectedTone = tone
                }) {
                    HStack {
                        Text(tone)
                            .foregroundColor(.black)
                        Spacer()
                        if selectedTone == tone {
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
                destination: QuizStep2View(viewModel: viewModel),
                isActive: Binding(
                    get: { !selectedTone.isEmpty },
                    set: { _ in }
                )
            ) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedTone.isEmpty ? Color.gray.opacity(0.3) : Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(selectedTone.isEmpty)
        }
        .padding()
        .onDisappear {
            viewModel.skinTone = selectedTone
        }
    }
}
