//
//  BaseController.swift
//  BudgetKit
//
//  Created by Boda Taljo on 17/05/2020.
//

import Foundation

class BKBaseController {
    static func budgetsBaseUrl() -> String {
        return BKAPI.baseURL + "budgets/"
    }
    
    static func baseURL(forBudget budgetId: UUID?) -> URL {
        let string = budgetsBaseUrl()
        if budgetId != nil {
            return URL(string: string)!
        }
        
        return URL(string: string + "default/")!
    }
    
    static func initialPath(forBudget budgetId: UUID?) -> String {
        guard let id = budgetId else {
            return ""
        }
        
        return id.uuidString
    }
}
