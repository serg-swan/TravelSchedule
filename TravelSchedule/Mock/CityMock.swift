//
//  MockData.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 09.11.2025.
//

import Foundation

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
