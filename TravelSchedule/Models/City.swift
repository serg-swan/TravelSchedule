//
//  City.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 24.11.2025.
//

import Foundation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let stations: [Station]
}
