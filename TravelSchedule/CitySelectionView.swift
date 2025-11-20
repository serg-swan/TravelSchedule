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
    @Binding var path: [SelectionType]
    let cities: [City]
    var onSelect: (() -> Void)? = nil
    @FocusState private var isSearchFieldFocused: Bool
    
    private var filteredCities: [City] {
        if searchText.isEmpty { return cities }
        let q = searchText.lowercased()
        return cities.filter { $0.name.lowercased().contains(q) }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(searchText.isEmpty ? .gray : .blackDay)
                    .padding(.leading, 8)
                
                TextField("Введите запрос", text: $searchText)
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
                if filteredCities.isEmpty && !searchText.isEmpty {
                    VStack {
                        Spacer()
                        Text("Город не найден")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.blackDay)
                            .padding(.init(top: 176, leading: 16, bottom: 176, trailing: 16))
                    }
                } else {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredCities) { city in
                            Button {
                                selectedCity = city.name
                                onSelect?()
                                searchText = ""
                            } label: {
                                HStack {
                                    Text(city.name)
                                        .font(.body)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blackDay)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 19)
                            }
                            .background(.clear)
                        }
                    }
                }
            }
        }
        .background(Color.whiteDay)
        .navigationTitle("Выберите город")
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
    
}
