//
//  AllergiesScreen.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct AllergiesScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    
    @EnvironmentObject var personalizedReportVm: PersonalizedReportViewModel
    @StateObject var viewModel = AllergiesViewModel()
    
    var body: some View {
        VStack {
            TextBoxView()
            
            Spacer()
            
            ProgressButtons()
        }
        .background(.theme)
    }
    
    func TextBoxView() -> some View {
        VStack {
            Text("Write any specific allergies or sensitivity towards specific things. (optional)")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primaryText)
            
            VStack(spacing: 0) {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 80, maximum: 120)),
                    GridItem(.adaptive(minimum: 80, maximum: 120)),
                ], alignment: .leading) {
                    ForEach(viewModel.selectedAllergies, id: \.self) { allergy in
                        Text(allergy.name)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .frame(height: 35)
                            .background(.primaryText)
                            .cornerRadius(20)
                            .onTapGesture {
                                viewModel.selectedAllergies.removeAll(where: { $0 == allergy })
                            }
                    }
                    
                    TextField("Enter allergy", text: $viewModel.text)
                        .tint(.primaryText)
                        .onChange(of: viewModel.text) { newText in
                            viewModel.loadAllergies()
                        }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .overlay {
                    Rectangle()
                        .stroke(.primaryText)
                }
                
                SuggestionView()
            }
        }
        .padding(.horizontal, 30)
    }
    
    @ViewBuilder
    func SuggestionView() -> some View {
        if !viewModel.text.isEmpty {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.allergies, id: \.self) { item in
                    Text(item.name)
                        .onTapGesture {
                            viewModel.allergies.removeAll(where: { $0 == item })
                            viewModel.selectedAllergies.append(item)
                            viewModel.text = ""
                        }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white)
            .overlay {
                Rectangle()
                    .stroke(.primaryText)
            }
        }
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
                coordinator.push(.questions)
                personalizedReportVm.selectedAllergies = viewModel.selectedAllergies
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
    AllergiesScreen()
        .environmentObject(Coordinator())
}
