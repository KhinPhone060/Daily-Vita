//
//  CoordinatorView.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .onboarding)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
