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
                  
        //testFetchStations()
        //testFetchSchedualBetweenStations()
        //testFetchStationSchedule()
        //testFetchRouteStations()
        //testFetchNearestCity()
        //testFetchCarrierInfo()
        // testFetchCopyright()
            testFetchAllStations()
            
               }
    }
}

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
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
            )
            print("Successfully fetched stations: \(stations)")
        } catch {
            print("Error fetching stations: \(error)")
        }
    }
}
func testFetchSchedualBetweenStations() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = SchedualBetweenStationsService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("FetchSchedualBetweenStations...")
            let schedual = try await service.getSchedualBetweenStations(
                from: "c146",
                to: "c213"
            )
            print("Successfully fetched schedual: \(schedual)")
        } catch {
            print("Error fetching schedual: \(error)")
        }
        
    }
}
func testFetchStationSchedule() {
    Task{
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = StationScheduleService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("Fetching station schedule...")
            let schedule = try await service.getStationSchedule(
                station: "s9600213"
            )
            print("Successfully fetched schedule: \(schedule)")
        } catch {
            print("Error fetching schedule: \(error)")
        }
    }
}
func testFetchRouteStations() {
    Task{
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = RouteStationsService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("Fetching route stations...")
            let stations = try await service.getRouteStations(
                uid: "2S-1002_251028_c66067_12"
            )
            print("Successfully fetched stations: \(stations)")
        } catch {
            print("Error fetching stations: \(error)")
        }
    }
}

func testFetchNearestCity() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = NearestCityService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("Fetching nearest city...")
            let city = try await service.getNearestCity(
                lat: 55.7558,     // Широта Москвы
                lng: 37.6173,     // Долгота Москвы
                distance: 50      // Радиус поиска 50 км
            )
            print("Successfully fetched city: \(city)")
        } catch {
            print("Error fetching city: \(error)")
        }
    }
}
func testFetchCarrierInfo() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = CarrierInfoService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("Fetching carrier info...")
            let carrier = try await service.getCarrierInfo(
                code: "TK",
                system: "iata"
            )
            print("Successfully fetched carrier: \(carrier)")
        } catch {
            print("Error fetching carrier: \(error)")
        }
    }
}
func testFetchCopyright() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = CopyrightService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("Fetching copyright info...")
            let copyright = try await service.getCopyright(
                apikey: APIKey.apiKey,
                format: "json"
            )
            print("Successfully fetched copyright: \(copyright)")
        } catch {
            print("Error fetching copyright: \(error)")
        }
    }
}
// Функция для тестирования сервиса списка станций
func testFetchAllStations() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = AllStationsService(
                client: client,
                apikey: APIKey.apiKey
            )
            print("Fetching all stations...")
            let stations = try await service.getAllStations(
                apikey: APIKey.apiKey
               
            )
            print("Successfully fetched stations")
            print("📊 Loaded \(stations.countries?.count ?? 0) countries")
        } catch {
            print("Error fetching stations: \(error)")
        }
    }
}
#Preview {
    ContentView()
}
