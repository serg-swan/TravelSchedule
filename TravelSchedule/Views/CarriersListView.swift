//
//  CarriersListView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 12.11.2025.
//

import SwiftUI

struct CarriersListView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @Bindable var vm: TravelViewModel
    let carriers: [CarrierInfo]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                titleView
                carriersList
            }
            
            bottomFilterButton
                .padding()
        }
        .background(Color(.whiteDay))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
    
    
    // MARK: - Title View
    private var titleView: some View {
        let from = "\(vm.from.selectedCity) (\(vm.from.selectedStation))"
        let to   = "\(vm.to.selectedCity) (\(vm.to.selectedStation))"
        
        return Text("\(from) — \(to)")
            .padding(.horizontal, 16)
            .font(.system(size: 24, weight: .bold))
    }
    
    
    // MARK: - Carriers List
    private var carriersList: some View {
        ScrollView(showsIndicators: false) {
            if vm.filteredCarriers(carriers).isEmpty {
                emptyPlaceholder
            } else {
                LazyVStack(spacing: 8) {
                    ForEach(vm.filteredCarriers(carriers)) { carrier in
                        CarriersRowView(carrier: carrier)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.bottom, 19)
    }
    
    
    // MARK: - Empty Placeholder
    private var emptyPlaceholder: some View {
        VStack {
            Spacer()
            Text("Вариантов нет")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blackDay)
                .padding(.vertical, 176)
            Spacer()
        }
    }
    
    
    // MARK: - Bottom Filter Button
    private var bottomFilterButton: some View {
        VStack {
            Spacer()
            NavigationLink {
                FilterView(selectedTimes: $vm.selectedTimes,
                           showTransfers: $vm.showTransfers)
            } label: {
                HStack(spacing: 4) {
                    Text("Уточнить время")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                    
                    if !vm.selectedTimes.isEmpty || vm.showTransfers != nil {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 8, height: 8)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.blueUniversal)
                .cornerRadius(16)
            }
            .padding(.bottom, 8)
        }
    }
}

#Preview {
    let vm = TravelViewModel()
    vm.from.selectedCity = "Москва"
    vm.from.selectedStation = "Курский вокзал"
    vm.to.selectedCity = "Санкт-Петербург"
    vm.to.selectedStation = "Московский вокзал"
    
    return NavigationStack {
        CarriersListView(vm: vm, carriers: CarrierInfoMock.carriers)
    }
}


#Preview {
    let vm = TravelViewModel()

       // Заполняем данные, чтобы в превью всё отображалось
       vm.from.selectedCity = "Москва"
       vm.from.selectedStation = "Курский вокзал"

       vm.to.selectedCity = "Санкт-Петербург"
       vm.to.selectedStation = "Московский вокзал"

       // Используем моковые перевозчики
       let carriers = CarrierInfoMock.carriers

    return NavigationStack {
        CarriersListView(vm: vm, carriers: carriers)
    }
}
