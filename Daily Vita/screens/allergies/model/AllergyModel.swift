//
//  AllergyModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

struct AllergyJSONModel: Codable {
    let data: [AllergyModel]
}

struct AllergyModel: Codable, Hashable {
    let id: Int
    let name: String
}
