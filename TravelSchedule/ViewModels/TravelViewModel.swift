//
//  TravelViewModel.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 10.11.2025.
//

import Foundation
import SwiftUI

@Observable
final class TravelViewModel {
    
    // MARK: - Состояние экранов
    var from = CitySelection()
    var to = CitySelection()
    
    // MARK: - Состояние рейсов
    var selectedTimes: [TimeOfDay] = []
    var showTransfers: Bool? = nil
    
    private let allStations = CityMock.cities.flatMap(\.stations)
    
   
    
    var filteredFromCities: [City] {
        filterCities(searchText: from.searchText)
    }
    
    var filteredToCities: [City] {
        filterCities(searchText: to.searchText)
    }
    
    var filteredFromStations: [Station] {
        filterStations(cityName: from.selectedCity, searchText: from.searchText)
    }
    
    var filteredToStations: [Station] {
        filterStations(cityName: to.selectedCity, searchText: to.searchText)
    }
    
    func filteredCarriers(_ carriers: [CarrierInfo]) -> [CarrierInfo] {
        carriers.filter { carrier in
            
            // 1. Фильтр по времени суток
            let matchesTime = selectedTimes.isEmpty
            || selectedTimes.contains(carrier.timeOfDay)
            
            // 2. Фильтр по наличию пересадок
            let hasTransfer = carrier.transfer != nil
            
            let matchesTransfer: Bool = {
                switch showTransfers {
                case true:  return true
                case false: return !hasTransfer
                case nil:   return true
                }
            }()
            
            return matchesTime && matchesTransfer
        }
    }
    // MARK: - Общая фильтрация городов
    private func filterCities(searchText: String) -> [City] {
        let allCities = CityMock.cities
        if searchText.isEmpty { return allCities }
        let query = searchText.lowercased()
        return allCities.filter { $0.name.lowercased().contains(query) }
    }
    // MARK: - Общая фильтрация станций
    private func filterStations(cityName: String, searchText: String) -> [Station] {
        guard let city = CityMock.cities.first(where: { $0.name == cityName }) else { return [] }
        if searchText.isEmpty { return city.stations }
        let query = searchText.lowercased()
        return city.stations.filter { $0.name.lowercased().contains(query) }
    }
    
}
