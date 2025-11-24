//
//  CarrierInfo.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 24.11.2025.
//

import Foundation

struct CarrierInfo: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
    let transfer: String?
    let departureDate: String
    let departureTime: String
    let arrivalTime: String
    let travelDuration: String
    let timeOfDay : TimeOfDay
  
    
    
}
