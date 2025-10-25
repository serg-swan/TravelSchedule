
//  NearestStationsService.swift.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 25.10.2025.


import Foundation
// 1. Импортируем библиотеки:
import OpenAPIRuntime
import OpenAPIURLSession


typealias NearestStations = Components.Schemas.Stations
protocol NearestStationsServiceProtocol {
 
  func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}
final class NearestStationsService: NearestStationsServiceProtocol {
  private let client: Client
  private let apikey: String
  
  init(client: Client, apikey: String) {
    self.client = client
    self.apikey = apikey
  }
 
  func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
    let response = try await client.getNearestStations(query: .init(
        apikey: apikey,     // Передаём API-ключ
        lat: lat,           // Передаём широту
        lng: lng,           // Передаём долготу
        distance: distance  // Передаём дистанцию
    ))
  
    return try response.ok.body.json
  }
}
