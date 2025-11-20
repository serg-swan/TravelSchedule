//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 18.11.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @Binding var selectedCity: String
    @Binding var searchText: String
    let cities: [City]
    @FocusState private var isSearchFieldFocused: Bool

    private var filteredCities: [City] {
        if searchText.isEmpty { return cities }
        return cities.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }

    var body: some View {
        VStack {
            // Поиск
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(searchText.isEmpty ? .gray : .black)
                    .padding(.leading, 8)
                TextField("Введите запрос", text: $searchText)
                    .textFieldStyle(.plain)
                    .font(.body)
                    .focused($isSearchFieldFocused)
                Spacer()
                if isSearchFieldFocused && !searchText.isEmpty {
                    Button { searchText = "" } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 6)
                }
            }
            .frame(height: 36)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))

            // Список через LazyVStack
            ScrollView {
                if filteredCities.isEmpty && !searchText.isEmpty {
                    VStack {
                        Spacer()
                        Text("Город не найден")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.vertical, 176)
                    }
                } else {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredCities) { city in
                            Button(city.name) {
                                selectedCity = city.name
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 19)
                            .background(Color.clear)
                        }
                    }
                }
            }
        }
        .background(Color.white)
        .navigationTitle("Выберите город")
    }
}
#Preview {
    
}
