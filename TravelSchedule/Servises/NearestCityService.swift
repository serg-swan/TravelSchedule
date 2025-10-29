//
//  NearestCityService.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 28.10.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestCityResponse = Components.Schemas.NearestCityResponse

protocol NearestCityServiceProtocol {
    func getNearestCity(lat: Double, lng: Double, distance: Int?) async throws -> NearestCityResponse
}

final class NearestCityService: NearestCityServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getNearestCity(lat: Double, lng: Double, distance: Int? = nil) async throws -> NearestCityResponse {
        let response = try await client.getNearestCity(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
}
