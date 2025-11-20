//
//  CarriersListView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 12.11.2025.
//

import SwiftUI

struct CarriersListView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable  var vm: TravelViewModel
    var carriers: [CarrierInfo]
    var body: some View {
        ZStack{
            VStack{
                let fromText = "\(vm.from.selectedCity) (\(vm.from.selectedStation))"
                let toText   = "\(vm.to.selectedCity) (\(vm.to.selectedStation))"
                Text("\(fromText) — \(toText)")
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .font(.system(size: 24, weight: .bold))
                ScrollView (showsIndicators: false) {
                    if vm.filteredCarriers(carriers).isEmpty {
                        VStack {
                            Spacer()
                            Text("Вариантов нет")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.blackDay)
                                .padding(.init(top: 176, leading: 16, bottom: 176, trailing: 16))
                        }
                    } else {
                        LazyVStack(spacing: 8) {
                            
                            ForEach(vm.filteredCarriers(carriers)) { carrier in
                                CarriersRowView(carrier: carrier)
                            }
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    }
                }
                .padding(.bottom, 19)
            }
            
            VStack{
                Spacer()
                NavigationLink {
                    FilterView(selectedTimes: $vm.selectedTimes, showTransfers: $vm.showTransfers)
                } label:{
                    HStack(spacing: 4){
                        Text("Уточнить время")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                        if !vm.selectedTimes.isEmpty ||
                            vm.showTransfers != nil {
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
            .padding()
        }
        .background(Color(.whiteDay))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
        
    }
    
}

#Preview {
    //  CarriersListView()
}
