//
//  DietsScreen.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct DietsScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    
    @EnvironmentObject var personalizedReportVm: PersonalizedReportViewModel
    @StateObject var viewModel = DietsViewModel()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Select the diets you follow.")
                    Text("*")
                        .foregroundColor(.red)
                }
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primaryText)
                
                VStack(spacing: 30) {
                    ForEach(viewModel.diets, id: \.self) { diet in
                        DietOption(diet)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            ProgressButtons()
        }
        .background(.theme)
    }
    
    @ViewBuilder
    func DietOption(_ diet: DietModel) -> some View {
        let isSelected = viewModel.selectedDiet.contains(diet)
        
        HStack(spacing: 20) {
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    if isSelected {
                        viewModel.selectedDiet.removeAll(where: { $0 == diet })
                    } else {
                        viewModel.selectedDiet.append(diet)
                    }
                }
            
            Text(diet.name)
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.teal)
                .help(diet.tool_tip)
            Spacer()
        }
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundColor(.primaryText)
    }
    
    func ProgressButtons() -> some View {
        HStack(spacing: 30) {
            Button {
                coordinator.pop()
            } label: {
                Text("Back")
                    .foregroundColor(.button)
            }
            
            Button {
                coordinator.push(.allergies)
                personalizedReportVm.selectedDiet = viewModel.selectedDiet
            } label: {
                Text("Next")
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 7)
                    .background(.button)
                    .cornerRadius(5)
            }
        }
        .padding(.bottom)
    }
}

#Preview {
    DietsScreen()
}
