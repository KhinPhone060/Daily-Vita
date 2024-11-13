//
//  Coordinator.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .onboarding:
            OnboardingScreen()
        case .healthConcerns:
            HealthConcernsScreen()
        case .diets:
            DietsScreen()
        case .allergies:
            AllergiesScreen()
        case .questions:
            QuestionsScreen()
        }
    }
}
