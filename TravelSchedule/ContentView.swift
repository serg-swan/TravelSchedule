//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 21.10.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
                  
                   testFetchStations()
               }
    }
}
// Функция для тестового вызова API
func testFetchStations() {
    Task {
        do {
            let client = Client(
               
                serverURL: try Servers.Server1.url(),
               
                transport: URLSessionTransport()
            )
            
            let service = NearestStationsService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("Fetching stations...")
            let stations = try await service.getNearestStations(
                lat: 59.864177, // Пример координат
                lng: 30.319163, // Пример координат
                distance: 50    // Пример дистанции
            )
            print("Successfully fetched stations: \(stations)")
        } catch {
          
            print("Error fetching stations: \(error)")
          
        }
    }
}

#Preview {
    ContentView()
}
