//
//  ErrorStateView.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 08.11.2025.
//

import SwiftUI

struct ErrorStateView: View {
    let type: ErrorStateType

    var body: some View {
        ZStack {
            Color.whiteDay.ignoresSafeArea()
            VStack {
                Label("", image: type.imageName)
                Text(type.title)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
            }
            .background(Color.whiteDay)
        }
    }
}

#Preview {
    ErrorStateView(type: .noInternet)
}
