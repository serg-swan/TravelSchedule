//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 18.11.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @Binding var selectedStation: String
    @Binding var searchText: String
    let stations: [Station]
    @Binding var path: [SelectionType]
    @FocusState private var isSearchFieldFocused: Bool
    
    private var filteredStations: [Station] {
        if searchText.isEmpty { return stations }
        return stations.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(searchText.isEmpty ? .gray : .blackDay)
                    .padding(.leading, 8)
                TextField("Введите станцию", text: $searchText)
                    .textFieldStyle(.plain)
                    .font(.body)
                    .focused($isSearchFieldFocused)
                Spacer()
                if isSearchFieldFocused && !searchText.isEmpty {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.grayUniversal)
                    }
                    .padding(.trailing, 6)
                }
            }
            .frame(height: 36)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
            
            ScrollView {
                if filteredStations.isEmpty && !searchText.isEmpty {
                    VStack {
                        Spacer()
                        Text("Станция не найдена")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.blackDay)
                            .padding(.init(top: 176, leading: 16, bottom: 176, trailing: 16))
                    }
                } else {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredStations) { station in
                            HStack {
                                Text(station.name)
                                    .font(.body)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.blackDay)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 19)
                            .background(Color.clear)
                            .onTapGesture {
                                selectedStation = station.name
                                searchText = ""
                                if !path.isEmpty {
                                    path.removeAll()
                                }
                            }
                        }
                    }
                }
            }
        }
        .background(Color(.whiteDay))
        .navigationTitle("Выберите станцию")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    path.removeLast()
                    searchText = ""
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}


    #Preview {
        @Previewable @State var selectedStation: String = ""
        @Previewable @State var searchText: String = ""
        @Previewable @State var path: [SelectionType] = [.fromStation]

        let mockStations: [Station] = [
            Station(name: "Курский вокзал"),
            Station(name: "Казанский вокзал"),
            Station(name: "Ленинградский вокзал"),
            Station(name: "Ярославский вокзал")
        ]

        return NavigationStack(path: $path) {
            StationSelectionView(
                selectedStation: $selectedStation,
                searchText: $searchText,
                stations: mockStations,
                path: $path
            )
        }
    }


