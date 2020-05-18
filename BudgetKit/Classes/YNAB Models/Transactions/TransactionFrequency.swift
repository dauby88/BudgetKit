//
//  TransactionFrequency.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/19/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public enum TransactionFrequency: String, Decodable {
    case never, daily, weekly, everyOtherWeek, twiceAMonth, every4Weeks, monthly, everyOtherMonth, every3Months, every4Months, twiceAYear, yearly, everyOtherYear
    
    public var description: String {
        switch self {
        case .never:
            return "Never"
        case .daily:
            return "Daily"
        case .weekly:
            return "Weekly"
        case .everyOtherWeek:
            return "Every Other Week"
        case .twiceAMonth:
            return "Twice A Month"
        case .every4Weeks:
            return "Every 4 Weeks"
        case .monthly:
            return "Monthly"
        case .everyOtherMonth:
            return "Every Other Month"
        case .every3Months:
            return "Every 3 Months"
        case .every4Months:
            return "Every 4 Months"
        case .twiceAYear:
            return "Twice A Year"
        case .yearly:
            return "Yearly"
        case .everyOtherYear:
            return "Every Other Year"
        }
    }
}
