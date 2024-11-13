//
//  OnboardingScreen.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct OnboardingScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer().frame(height: 40)
            
            VStack(alignment: .leading) {
                Text("Welcome to Daily Vita")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Hello, we are here to make your life healthier and happier")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            Image(.onboarding)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("We will ask a couple of questions to better understand your vitamin need.")
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal)
            
            Spacer()
            
            Button {
                coordinator.push(.healthConcerns)
            } label: {
                Text("Get Started")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.teal)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingScreen()
        .environmentObject(Coordinator())
}
