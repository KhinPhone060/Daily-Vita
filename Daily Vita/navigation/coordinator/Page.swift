//
//  Page.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

enum Page: String, Identifiable {
    case onboarding
    case healthConcerns
    case diets
    case allergies
    case questions
    
    var id: String {
        self.rawValue
    }
}
