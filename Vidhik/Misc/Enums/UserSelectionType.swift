//
//  UserSelectionType.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/04/24.
//

import Foundation

// MARK: - User Selection Type Enum
enum UserSelectionType: String {
    case lawyer = "Lawyer"
    case user = "User"
    case judge = "Judge"
    case seller = "Seller"
}


// MARK: - Enum Created On KVKCalender
enum SelectedCalendarType {
    case today
    case week
    case month
    var height: CGFloat {
        switch self {
        case .today:
            return 1
        case .week:
            return 70
        case .month:
            return 70
        }
    }
}

// MARK: - Enum Created On KVKCalender on Previous and Next Button
enum PreviousAndNext {
    case back
    case forward
}
