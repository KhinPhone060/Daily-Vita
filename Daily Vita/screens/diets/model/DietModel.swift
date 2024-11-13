//
//  DietModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

struct DietsJSONModel: Codable {
    let data: [DietModel]
}

struct DietModel: Codable, Hashable {
    let id: Int
    let name: String
    let tool_tip: String
}
