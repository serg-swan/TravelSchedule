//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 21.10.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    @State private var vm = APITestViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            
            //vm.testFetchStations()
            //vm.testFetchSchedualBetweenStations()
            // vm.testFetchStationSchedule()
            //  vm.testFetchRouteStations()
            //vm.testFetchNearestCity()
            // vm.testFetchCarrierInfo()
            // vm.testFetchCopyright()
            //  vm.testFetchAllStations()
            
        }
    }
}



#Preview {
    ContentView()
}
