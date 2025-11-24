//
//  TimeOfDay.swift
//  TravelSchedule
//
//  Created by Сергей Лебедь on 24.11.2025.
//

import Foundation

enum TimeOfDay: CaseIterable {
    case morning      // 06:00 - 11:59
    case afternoon    // 12:00 - 17:59
    case evening      // 18:00 - 23:59
    case night        // 00:00 - 05:59
    
    var displayName: String {
          switch self {
          case .morning: return "Утро 06:00 - 12:00"
          case .afternoon: return "День 12:00 - 18:00"
          case .evening: return "Вечер 18:00 - 00:00"
          case .night: return "Ночь 00:00 - 06:00"
          }
      }
}
