//
//  QuizViewModel.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var skinTone: String = ""
    @Published var hairColor: String = ""
    @Published var eyeColor: String = ""

    var resultSeason: String {
        if skinTone == "Fair" && hairColor == "Blonde" {
            return "Spring"
        } else if skinTone == "Deep" && eyeColor == "Brown" {
            return "Autumn"
        } else {
            return "Winter"
        }
    }
}
