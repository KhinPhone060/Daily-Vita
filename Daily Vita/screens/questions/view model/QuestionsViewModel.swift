//
//  QuestionsViewModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

class QuestionsViewModel: ObservableObject {
    @Published var isDailyExposure = false
    @Published var isSmoke = false
    @Published var alchool: Alchohol = .zeroToOne
}
