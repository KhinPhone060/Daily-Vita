//
//  RadioButton.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct RadioButton: View {
    @Binding var isSelected: Bool
    var label: String
    
    var body: some View {
        HStack {
            Button {
                isSelected.toggle()
            } label: {
                HStack {
                    ZStack {
                        Circle()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(.primaryText)
                            .frame(width: 24, height: 24)
                        
                        if isSelected {
                            Circle()
                                .foregroundColor(.primaryText)
                                .frame(width: 16, height: 16)
                        }
                    }
                    
                    Text(label)
                        .foregroundColor(.primaryText)
                        .fontWeight(.medium)
                }
                .padding(5)
            }
        }
    }
}

