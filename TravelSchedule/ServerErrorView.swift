//
//  ServerErrorView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 08.11.2025.
//

import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        ZStack{
            Color.whiteDay.ignoresSafeArea(.all)
            VStack{
                Label("", image: "serverError")
                Text("Ошибка сервера")
                    .font(.system(size: 24, weight: .bold))
                    .padding()
            }
            .background(Color(.whiteDay))
        }
    }
}

#Preview {
    ServerErrorView()
}
