//
//  PersonalizedReportViewModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

class PersonalizedReportViewModel: ObservableObject {
    @Published var selectedHealthConcerns: [HealthConcernEntity] = []
    @Published var selectedDiet: [DietModel] = []
    @Published var selectedAllergies: [AllergyModel] = []
    
    @Published var isDailyExposure = false
    @Published var isSmoke = false
    @Published var alchool: Alchohol = .zeroToOne
    
    func printOutPersonalizedReport() {
        print("Health Concerns: \(selectedHealthConcerns)")
        print("Diets: \(selectedDiet)")
        print("Allergies: \(selectedAllergies)")
        
        print("Is Daily Exposure: \(isDailyExposure)")
        print("Is Smoke: \(isSmoke)")
        print("Alchohol: \(alchool.rawValue)")
    }
}
