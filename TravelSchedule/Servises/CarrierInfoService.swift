//
//  CarrierInfoService.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 28.10.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias CarrierResponse = Components.Schemas.CarrierResponse

protocol CarrierInfoServiceProtocol {
    func getCarrierInfo(code: String, system: String?) async throws -> CarrierResponse
}

final class CarrierInfoService: CarrierInfoServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarrierInfo(code: String, system: String? = nil) async throws -> CarrierResponse {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code,
            system: system
        ))
        return try response.ok.body.json
    }
}
