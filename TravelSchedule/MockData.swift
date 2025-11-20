//
//  MockData.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 09.11.2025.
//

import Foundation
import Foundation

enum SelectionType {
    case fromCity
    case fromStation
    case toCity
    case toStation
}


enum TimeOfDay: CaseIterable {
    case morning      // 06:00 - 11:59
    case afternoon    // 12:00 - 17:59
    case evening      // 18:00 - 23:59
    case night        // 00:00 - 05:59
    
    var displayName: String {
          switch self {
          case .morning: return "Утро 06:00 - 12:00"
          case .afternoon: return "День 12:00 - 18:00"
          case .evening: return "Вечер 18:00 - 00:00"
          case .night: return "Ночь 00:00 - 06:00"
          }
      }
}
struct City: Identifiable {
    let id = UUID()
    let name: String
    let stations: [Station]
}

struct Station: Identifiable {
    let id = UUID()
    let name: String
}

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

struct CarrierMockData {
    static let carriers: [CarrierInfo] = [
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening),
        CarrierInfo(name: "ФГК", logo: "FGK", transfer: nil, departureDate: "15 января", departureTime: "01:15", arrivalTime: "09:00", travelDuration: "9 часов", timeOfDay: .night),
        CarrierInfo(name: "Урал логистика", logo: "UralLog", transfer: nil, departureDate: "16 января", departureTime: "12:30", arrivalTime: "21:00", travelDuration: "9 часов", timeOfDay: .afternoon),
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening),
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening),
        CarrierInfo(name: "РЖД", logo: "RZD", transfer: "С пересадкой в Костроме", departureDate: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelDuration: "20 часов", timeOfDay: .evening)
]
        
}

struct MockData {
    static let cities: [City] = [
        City(name: "Москва", stations: [
            Station(name: "Курский вокзал"),
            Station(name: "Казанский вокзал"),
            Station(name: "Ленинградский вокзал"),
            Station(name: "Ярославский вокзал"),
            Station(name: "Павелецкий вокзал"),
            Station(name: "Киевский вокзал")
        ]),
        
        City(name: "Санкт-Петербург", stations: [
            Station(name: "Московский вокзал"),
            Station(name: "Ладожский вокзал"),
            Station(name: "Финляндский вокзал"),
            Station(name: "Балтийский вокзал"),
            Station(name: "Витебский вокзал"),
            Station(name: "Станция Сестрорецк")
        ]),
        
        City(name: "Екатеринбург", stations: [
            Station(name: "Екатеринбург-Пасс."),
            Station(name: "Станция Шарташ"),
            Station(name: "Станция Путёвка"),
            Station(name: "Станция Ельцино"),
            Station(name: "Станция Палкино"),
            Station(name: "Станция Гать")
        ]),
        
        City(name: "Новосибирск", stations: [
            Station(name: "Новосибирск-Главный"),
            Station(name: "Станция Речной вокзал"),
            Station(name: "Станция Заельцовская"),
            Station(name: "Станция Инская"),
            Station(name: "Станция Новосибирск-Южный"),
            Station(name: "Станция Сеятель")
        ]),
        
        City(name: "Казань", stations: [
            Station(name: "Казань-Пасс."),
            Station(name: "Станция Вахитово"),
            Station(name: "Станция Адмиралтейская"),
            Station(name: "Станция Караваево"),
            Station(name: "Станция Лагерная"),
            Station(name: "Станция Юдино")
        ]),
        
        City(name: "Краснодар", stations: [
            Station(name: "Краснодар-1"),
            Station(name: "Станция Краснодар-Сорт."),
            Station(name: "Станция Энем"),
            Station(name: "Станция Марьянская"),
            Station(name: "Станция Тихорецкая"),
            Station(name: "Станция Кавказская")
        ])
    ]
    
}
