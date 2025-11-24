//
//  TabBarView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 04.11.2025.
//


import SwiftUI


struct TabBarView: View {
    @State var vm = TravelViewModel()
    
    var body: some View {
        TabView {
            StartView(vm: vm)
                .tabItem {
                    Label("", image: "schedule")
                }
            
            SettingView()
                .tabItem {
                    Label("", image: "settingsImage")
                }
        }
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Color.black.opacity(0.3))
                .frame(height: 0.5)
                .padding(.bottom, 49)
        }
        .tint(.blackDay)
    }
}

#Preview {
    TabBarView()
}
