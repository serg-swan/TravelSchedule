//
//  CarriersRowView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 12.11.2025.
//

import SwiftUI

struct CarriersRowView: View {
    var carrier: CarrierInfo
    var body: some View {
        VStack(spacing: 18) {
          
            HStack{
                Image(carrier.logo)
                    .resizable()
                    .frame(width: 38, height: 38)
                    .cornerRadius(12)
                VStack(alignment: .leading){
                    HStack{
                        Text(carrier.name)
                            .font(.system(size: 17))
                        Spacer()
                        Text(carrier.departureDate)
                            .font(.system(size: 12))
                    }
                    if carrier.transfer != nil {
                        Text(carrier.transfer ?? "")
                        
                            .font(.system(size: 12))
                            .foregroundColor(Color(.redUniversal))
                    }
                }
                
            }
            HStack{
                Text(carrier.departureTime)
                    .font(.system(size: 17))
                Rectangle()
                               .fill(Color.grayUniversal)
                               .frame(height: 1)
                Text(carrier.travelDuration)
                    .font(.system(size: 12))
                   
                Rectangle()
                               .fill(Color.gray)
                               .frame(height: 1)
                Text(carrier.arrivalTime)
                    .font(.system(size: 17))
                
            }
            
        }
        .padding(14)
        .background(Color(.lightGray))
        .cornerRadius(24)
        .colorScheme(ColorScheme.light)
    }
}

#Preview {
    CarriersRowView(carrier: CarrierMockData.carriers.first!)
}
