//
//  Daily_VitaApp.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

@main
struct Daily_VitaApp: App {
    @StateObject var personalizedReportViewModel = PersonalizedReportViewModel()
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(personalizedReportViewModel)
        }
    }
}
