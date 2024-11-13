//
//  HealthConcernModel.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import Foundation

struct HealthConcernJSONModel: Codable {
    let data: [HealthConcernModel]
}

struct HealthConcernModel: Codable, Hashable {
    let id: Int
    let name: String
}
