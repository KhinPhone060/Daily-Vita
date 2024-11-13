//
//  AllergiesViewModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

class AllergiesViewModel: ObservableObject {
    @Published var text = ""
    @Published var allergies: [AllergyModel] = []
    @Published var selectedAllergies: [AllergyModel] = []
    
    
    // Loads the allergies from JSON file
        func loadAllergies() {
            if let url = Bundle.main.url(forResource: "allergies", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let items = try JSONDecoder().decode(AllergyJSONModel.self, from: data)
                    
                    // Filter allergies by the text property when data is loaded
                    if text.isEmpty {
                        allergies = items.data // If no text, show all allergies
                    } else {
                        allergies = items.data.filter { $0.name.lowercased().contains(text.lowercased()) }
                    }
                    
                    allergies = allergies.filter { !selectedAllergies.contains($0) }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else {
                print("File not found.")
            }
        }
}
