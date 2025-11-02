//
//  RouteStationsService.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 28.10.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias RouteStationsResponse = Components.Schemas.ThreadStationsResponse

protocol RouteStationsServiceProtocol {
    func getRouteStations(uid: String) async throws -> RouteStationsResponse
}

final class RouteStationsService: RouteStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getRouteStations(uid: String) async throws -> RouteStationsResponse {
        let response = try await client.getRouteStations(query: .init(
            apikey: apikey,
            uid: uid))
        return try response.ok.body.json
    }
}
