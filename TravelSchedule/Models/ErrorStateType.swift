//
//  ErrorStateType.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 22.11.2025.
//

import Foundation

enum ErrorStateType {
    case noInternet
    case serverError

    var imageName: String {
        switch self {
        case .noInternet: return "noInternet"
        case .serverError: return "serverError"
        }
    }

    var title: String {
        switch self {
        case .noInternet: return "Нет интернета"
        case .serverError: return "Ошибка сервера"
        }
    }
}
