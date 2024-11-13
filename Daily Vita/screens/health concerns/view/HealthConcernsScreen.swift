//
//  HealthConcernsScreen.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct HealthConcernsScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    
    @EnvironmentObject var personalizedReportVm: PersonalizedReportViewModel
    @StateObject var viewModel = HealthConcernViewModel()
    
    @State private var draggedItem: Int?
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                HealthConcernSelectionGridView()
                
                PrioritizeList()
            }
            Spacer()
            
            ProgressButtons()
        }
        .background(.theme)
    }
    
    @ViewBuilder
    func HealthConcernSelectionGridView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Select the top 5 health concerns.")
                    Text("*")
                        .foregroundColor(.red)
                }
                Text("(up to 5)")
            }
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.primaryText)
            
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 80, maximum: .infinity))
            ], spacing: 15) {
                ForEach(viewModel.healthConcerns, id: \.self) { item in
                    Button {
                        // Check if the item is already selected
                        if let index = viewModel.selectedHealthConcerns.firstIndex(where: { item.id == $0.id }) {
                            // If the item is already in the selected array, remove it
                            viewModel.selectedHealthConcerns.remove(at: index)
                        } else {
                            // If the item is not in the selected array and less than 5 items are selected
                            if viewModel.selectedHealthConcerns.count < 5 {
                                // Set the priority for the new item
                                let priority = viewModel.selectedHealthConcerns.isEmpty ? 1 : viewModel.selectedHealthConcerns.count + 1
                                viewModel.selectedHealthConcerns.append(HealthConcernEntity(id: item.id, name: item.name, priority: priority))
                            } else {
                                // Optionally show an alert or message that the limit has been reached
                                print("You can only select up to 5 items.")
                            }
                        }
                    } label: {
                        HealthConcernItem(item)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func HealthConcernItem(_ item: HealthConcernModel) -> some View {
        let isSelected = viewModel.selectedHealthConcerns.contains(where: { item.id == $0.id })
        Text(item.name)
            .fontWeight(.medium)
            .foregroundColor(isSelected ? .white : .primaryText)
            .padding(.horizontal, 16)
            .frame(height: 35)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.primaryText : Color.clear)
            .cornerRadius(20)
            .overlay {
                // If not selected, show a border around the item
                if !isSelected {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.primaryText)
                }
            }
            .animation(.easeInOut, value: isSelected)
    }
    
    @ViewBuilder
    func PrioritizeList() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Prioritize")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primaryText)
            
            LazyVStack {
                ForEach(viewModel.selectedHealthConcerns, id: \.self) { item in
                    PriorityItem(name: item.name)
                        .onDrag {
                            self.draggedItem = item.id
                            return NSItemProvider()
                        }
                        .onDrop(of: [.text],
                                delegate: DropViewDelegate(destinationItem: item.priority, priority: $viewModel.selectedHealthConcerns, draggedItem: $draggedItem)
                        )
                        .transition(.move(edge: .top))
                        .animation(.easeInOut, value: viewModel.selectedHealthConcerns)
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func PriorityItem(name: String) -> some View {
        HStack {
            Text(name)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .frame(height: 35)
                .background(.primaryText)
                .cornerRadius(20)
            
            Spacer()
            
            Image(systemName: "line.3.horizontal")
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(.box)
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primaryText)
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
                coordinator.push(.diets)
                personalizedReportVm.selectedHealthConcerns = viewModel.selectedHealthConcerns
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
    HealthConcernsScreen()
}
