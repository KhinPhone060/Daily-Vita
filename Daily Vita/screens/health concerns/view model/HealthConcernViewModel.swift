//
//  HealthConcernViewModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

class HealthConcernViewModel: ObservableObject {
    @Published var healthConcerns: [HealthConcernModel] = []
    
    @Published var selectedHealthConcerns: [HealthConcernEntity] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let url = Bundle.main.url(forResource: "Healthconcern", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let items = try JSONDecoder().decode(HealthConcernJSONModel.self, from: data)
                healthConcerns = items.data
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("File not found.")
        }
    }
}
