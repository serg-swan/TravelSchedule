//
//  FilterView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 15.11.2025.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTimes: [TimeOfDay]
    @Binding var showTransfers: Bool?
    var body: some View {
        VStack(spacing: 36){
            Section(header:
                        Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            ){
                ForEach(TimeOfDay.allCases, id: \.self) { time in
                    
                    HStack {
                        Text(time.displayName)
                            .font(.system(size: 17))
                        Spacer()
                        Button(action: {
                            if selectedTimes.contains(time) {
                                selectedTimes.removeAll { $0 == time }
                            } else {
                                selectedTimes.append(time)
                            }
                        }) {
                            if selectedTimes.contains(time) {
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundColor(.blackDay)
                            } else {
                                Image(systemName: "square")
                                    .foregroundColor(.blackDay)
                            }
                        }
                    }
                    
                }
            }
            Section(header:
                        Text("Показывать варианты с пересадками")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            ){
                HStack {
                    Text("Да")
                        .font(.system(size: 17))
                    Spacer()
                    Button(action: {
                        showTransfers = true
                    }){
                        if showTransfers == true {
                            Image(systemName: "record.circle")
                                .foregroundColor(.blackDay)
                            
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.blackDay)
                        }
                    }
                }
                HStack {
                    Text("Нет")
                        .font(.system(size: 17))
                    Spacer()
                    Button(action: {
                        showTransfers = false
                    }){
                        if showTransfers == false {
                            Image(systemName: "record.circle")
                                .foregroundColor(.blackDay)
                            
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.blackDay)
                        }
                    }
                }
            }
            
            Spacer()
            Button {
                dismiss()
            } label:{
                HStack(spacing: 4){
                    Text("Уточнить время")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 8, height: 8)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.blueUniversal)
                .cornerRadius(16)
            }
            
            .padding(.bottom, 8)
        }
        
        .padding(16)
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
    // FilterView()
}
