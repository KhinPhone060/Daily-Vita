//
//  QuestionsScreen.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct QuestionsScreen: View {
    @StateObject var viewModel = QuestionsViewModel()
    
    var body: some View {
        VStack {
            Group {
                Question1()
                Question2()
                Question3()
            }
            .padding()
            
            Spacer()
            
            OutputButton()
        }
        .background(.theme)
    }
    
    func Question1() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Is your daily exposure to sun is limited?")
                Text("*")
                    .foregroundColor(.red)
                Spacer()
            }
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.primaryText)
            
            RadioButton(isSelected: createBinding(for: true, keyPath: \.isDailyExposure), label: "Yes")
            RadioButton(isSelected: createBinding(for: false, keyPath: \.isDailyExposure), label: "No")
        }
    }
    
    func Question2() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Do you currently smoke (tobacco or marijuana)?")
                Text("*")
                    .foregroundColor(.red)
                Spacer()
            }
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.primaryText)
            
            RadioButton(isSelected: createBinding(for: true, keyPath: \.isSmoke), label: "Yes")
            RadioButton(isSelected: createBinding(for: false, keyPath: \.isSmoke), label: "No")
        }
    }
    
    func Question3() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("On Average, how many alcoholic beverages do you have in a week?")
                Text("*")
                    .foregroundColor(.red)
                Spacer()
            }
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.primaryText)
            
            ForEach(Alchohol.allCases, id: \.self) { item in
                RadioButton(isSelected: createBinding(for: item), label: item.rawValue)
            }
        }
    }
    
    func createBinding(for value: Bool, keyPath: ReferenceWritableKeyPath<QuestionsViewModel, Bool>) -> Binding<Bool> {
        Binding(get: {
            viewModel[keyPath: keyPath] == value
        }, set: { _ in
            viewModel[keyPath: keyPath] = value
        })
    }
    
    func createBinding(for item: Alchohol) -> Binding<Bool> {
        Binding(get: {
            viewModel.alchool == item
        }, set: { _ in
            viewModel.alchool = item
        })
    }
    
    func OutputButton() -> some View {
        Button {
            
        } label: {
            Text("Get my personalized vitamin")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.button)
                .cornerRadius(5)
        }
        .padding()
    }
}

#Preview {
    QuestionsScreen()
}
