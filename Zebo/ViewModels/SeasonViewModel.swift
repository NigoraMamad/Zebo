//
//  SeasonViewModel.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import Foundation
import SwiftUI

class SeasonViewModel: ObservableObject {
    @Published var detectedSeason: String = "Analyzing..."
    
    func updateSeason(to season: String) {
        DispatchQueue.main.async {
            self.detectedSeason = season
        }
    }
}
