//
//  CarrierMockData.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 24.11.2025.
//

import Foundation

struct CarrierInfoMock {
    static let carriers: [CarrierInfo] = [
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening),
        CarrierInfo(name: "ФГК", logo: "FGK", transfer: nil, departureDate: "15 января", departureTime: "01:15", arrivalTime: "09:00", travelDuration: "9 часов", timeOfDay: .night),
        CarrierInfo(name: "Урал логистика", logo: "UralLog", transfer: nil, departureDate: "16 января", departureTime: "12:30", arrivalTime: "21:00", travelDuration: "9 часов", timeOfDay: .afternoon),
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening),
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening),
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening)
]
        
}
