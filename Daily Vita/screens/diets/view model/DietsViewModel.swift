//
//  DietsViewModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

class DietsViewModel: ObservableObject {
    @Published var diets: [DietModel] = []
    @Published var selectedDiet: [DietModel] = []
    
    init() {
        loadDiets()
    }
    
    func loadDiets() {
        if let url = Bundle.main.url(forResource: "Diets", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let items = try JSONDecoder().decode(DietsJSONModel.self, from: data)
                diets = items.data
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("File not found.")
        }
    }
}
