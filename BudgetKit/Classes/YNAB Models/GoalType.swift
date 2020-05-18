//
//  GoalType.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public enum GoalType: String, Decodable {
    case targetCategoryBalance = "TB"
    case targetCategoryBalanceByDate = "TBD"
    case monthlyFunding = "MF"
    case needGoal = "NEED"
    
    public var description: String {
        switch self {
        case .targetCategoryBalance:
            return "Target Category Balance"
        case .targetCategoryBalanceByDate:
            return "Target Category Balance by Date"
        case .monthlyFunding:
            return "Monthly Funding"
        case .needGoal:
            return "Plan Your Spending"
        }
    }
    
    public var abbreviation: String {
        return self.rawValue
    }
}
