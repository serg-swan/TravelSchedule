//
//  CarriersRowView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 12.11.2025.
//

import SwiftUI


import SwiftUI

struct CarriersRowView: View {
    // MARK: - Properties
    let carrier: CarrierInfo
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 18) {
            headerSection
            timeSection
        }
        .padding(14)
        .background(Color(.lightGray))
        .cornerRadius(24)
        .colorScheme(.light)
    }
    
    
    // MARK: - Vievs
    private var headerSection: some View {
        HStack {
            logoView
            
            VStack(alignment: .leading) {
                titleRow
                
                if let transfer = carrier.transfer {
                    Text(transfer)
                        .font(.system(size: 12))
                        .foregroundColor(Color(.redUniversal))
                }
            }
        }
    }
    
    private var logoView: some View {
        Image(carrier.logo)
            .resizable()
            .frame(width: 38, height: 38)
            .cornerRadius(12)
    }
    
    private var titleRow: some View {
        HStack {
            Text(carrier.name)
                .font(.system(size: 17))
            Spacer()
            Text(carrier.departureDate)
                .font(.system(size: 12))
        }
    }
    
    private var timeSection: some View {
        HStack {
            Text(carrier.departureTime)
                .font(.system(size: 17))
            
            dividerLine
            
            Text(carrier.travelDuration)
                .font(.system(size: 12))
            
            dividerLine
            
            Text(carrier.arrivalTime)
                .font(.system(size: 17))
        }
    }
    
    private var dividerLine: some View {
        Rectangle()
            .fill(Color.grayUniversal)
            .frame(height: 1)
    }
}

#Preview {
    CarriersRowView(
        carrier: CarrierInfoMock.carriers.first!
    )
}
