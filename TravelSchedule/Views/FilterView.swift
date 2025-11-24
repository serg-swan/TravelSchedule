//
//  FilterView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 15.11.2025.
//

import SwiftUI




import SwiftUI

struct FilterView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTimes: [TimeOfDay]
    @Binding var showTransfers: Bool?
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 36) {
            timeSection
            transfersSection
            Spacer()
            applyButton
        }
        .padding(16)
        .background(Color(.whiteDay))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                backButton
            }
        }
    }
    
    
    // MARK: - Time Section
    private var timeSection: some View {
        Section(
            header: Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
        ) {
            ForEach(TimeOfDay.allCases, id: \.self) { time in
                timeRow(for: time)
            }
        }
    }
    
    private func timeRow(for time: TimeOfDay) -> some View {
        HStack {
            Text(time.displayName)
                .font(.system(size: 17))
            Spacer()
            
            Button {
                toggleTime(time)
            } label: {
                Image(systemName: selectedTimes.contains(time)
                      ? "checkmark.square.fill"
                      : "square")
                    .foregroundColor(.blackDay)
            }
        }
    }
    
    private func toggleTime(_ time: TimeOfDay) {
        if selectedTimes.contains(time) {
            selectedTimes.removeAll { $0 == time }
        } else {
            selectedTimes.append(time)
        }
    }
    
    
    // MARK: - Transfers Section
    private var transfersSection: some View {
        Section(
            header: Text("Показывать варианты с пересадками")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
        ) {
            yesTransfersRow
            noTransfersRow
        }
    }
    
    private var yesTransfersRow: some View {
        HStack {
            Text("Да")
                .font(.system(size: 17))
            Spacer()
            
            Button {
                showTransfers = true
            } label: {
                Image(systemName: showTransfers == true ? "record.circle" : "circle")
                    .foregroundColor(.blackDay)
            }
        }
    }
    
    private var noTransfersRow: some View {
        HStack {
            Text("Нет")
                .font(.system(size: 17))
            Spacer()
            
            Button {
                showTransfers = false
            } label: {
                Image(systemName: showTransfers == false ? "record.circle" : "circle")
                    .foregroundColor(.blackDay)
            }
        }
    }
    
    
    // MARK: - Apply Button
    private var applyButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 4) {
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
    
    
    // MARK: - Back Button
    private var backButton: some View {
        Button { dismiss() } label: {
            Image(systemName: "chevron.left")
        }
    }
}

    #Preview {
        @Previewable @State var selectedTimes: [TimeOfDay] = [.morning]
        @Previewable @State var showTransfers: Bool? = nil

        return NavigationStack {
            FilterView(
                selectedTimes: $selectedTimes,
                showTransfers: $showTransfers
            )
        }
    }

