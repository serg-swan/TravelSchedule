//
//  StartView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 24.11.2025.
//
import SwiftUI

struct StartView: View {
    @Bindable var vm: TravelViewModel
    @State private var path: [SelectionType] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.whiteDay.ignoresSafeArea(.all)
                VStack{
                    HStack(spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 0) {
                            
                            Button {
                                path.append(.fromCity)
                            } label: {
                                HStack {
                                    Text(
                                        vm.from.selectedCity.isEmpty && vm.from.selectedStation.isEmpty
                                        ? "Откуда"
                                        : "\(vm.from.selectedCity) (\(vm.from.selectedStation))"
                                    )
                                    .lineLimit(1)
                                    .foregroundColor(
                                        vm.from.selectedCity.isEmpty
                                        ? .gray
                                        : .blackDay
                                    )
                                    Spacer()
                                }
                                .font(.system(size: 17))
                                .padding(.init(top: 14, leading: 13, bottom: 14, trailing: 16))
                            }
                            
                            Button {
                                path.append(.toCity)
                            } label: {
                                HStack {
                                    Text(
                                        vm.to.selectedCity.isEmpty && vm.to.selectedStation.isEmpty
                                        ? "Куда"
                                        : "\(vm.to.selectedCity) (\(vm.to.selectedStation))"
                                    )
                                    .lineLimit(1)
                                    .foregroundColor(
                                        vm.to.selectedCity.isEmpty
                                        ? .gray
                                        : .blackDay
                                    )
                                    Spacer()
                                }
                                .font(.system(size: 17))
                                .padding(.init(top: 14, leading: 13, bottom: 14, trailing: 16))
                            }
                            
                        }
                        .background(.whiteUniversal)
                        .cornerRadius(20)
                        
                        Button {
                            let tmp = vm.from
                            vm.from = vm.to
                            vm.to = tmp
                        } label: {
                            Image("change")
                                .frame(width: 24, height: 24)
                                .padding(6)
                                .background(.whiteUniversal)
                                .clipShape(Circle())
                        }
                    }
                    .padding(16)
                    .background(.blueUniversal)
                    .cornerRadius(20)
                    
                    if  !vm.to.selectedCity.isEmpty &&
                            !vm.from.selectedCity.isEmpty {
                        NavigationLink {
                            CarriersListView(
                                vm: vm,
                                carriers: CarrierInfoMock.carriers
                                
                            )
                        } label:{
                            Text ("Найти")
                                .frame(width: 150, height: 60)
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color(.white))
                        }
                        .background(.blueUniversal)
                        .cornerRadius(16)
                        
                    }
                }
                .padding(16)
                .colorScheme(.light)
                
                .navigationDestination(for: SelectionType.self) { type in
                    switch type {
                    case .fromCity:
                        CitySelectionView(
                            selectedCity: $vm.from.selectedCity,
                            searchText: $vm.from.searchText,
                            path: $path,
                            cities: CityMock.cities
                            
                        ) {
                            path.append(.fromStation)
                        }
                    case .toCity:
                        CitySelectionView(
                            selectedCity: $vm.to.selectedCity,
                            searchText: $vm.to.searchText,
                            path: $path,
                            cities: CityMock.cities
                            
                        ) {
                            path.append(.toStation)
                        }
                    case .fromStation:
                        StationSelectionView(
                            selectedStation: $vm.from.selectedStation,
                            searchText: $vm.from.searchText,
                            stations: vm.filteredFromStations,
                            path: $path
                        )
                    case .toStation:
                        StationSelectionView(
                            selectedStation: $vm.to.selectedStation,
                            searchText: $vm.to.searchText,
                            stations: vm.filteredToStations,
                            path: $path
                        )
                        
                    }
                }
                
                
            }
            
        }
    }
    
    private func bindingCity(for type: SelectionType) -> Binding<String> {
        switch type {
        case .fromCity: return $vm.from.selectedCity
        case .toCity: return $vm.to.selectedCity
        default: return .constant("")
        }
    }
    
    private func bindingSearch(for type: SelectionType) -> Binding<String> {
        switch type {
        case .fromCity: return $vm.from.searchText
        case .toCity: return $vm.to.searchText
        default: return .constant("")
        }
        
    }
}
