//
//  AllStationsService.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 29.10.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias AllStations = Components.Schemas.AllStationsResponse

protocol AllStationsServiceProtocol {
    func getAllStations(apikey: String) async throws -> AllStations
}

final class AllStationsService: AllStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getAllStations(apikey: String) async throws -> AllStations {
       let response = try await client.getAllStations(query: .init(apikey: apikey))

        let responseBody = try response.ok.body.html

       let limit = 50 * 1024 * 1024 // 50Mb
       let fullData = try await Data(collecting: responseBody, upTo: limit)

       let allStations = try JSONDecoder().decode(AllStations.self, from: fullData)

       return allStations
    }
}
