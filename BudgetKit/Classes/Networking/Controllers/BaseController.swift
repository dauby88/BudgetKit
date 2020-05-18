//
//  BaseController.swift
//  BudgetKit
//
//  Created by Boda Taljo on 17/05/2020.
//

import Foundation

class BaseController {
    static let budgetsBaseUrl = API.baseURL + "budgets/"
    static let userBaseUrl = API.baseURL + "user/"
    
    private static func budgetBaseUrl(forBudget budgetId: UUID?) -> String {
        if let id = budgetId {
            return budgetsBaseUrl + id.uuidString + "/"
        }
        
        return budgetsBaseUrl + "default/"
    }
    
    static func createUrl(forBudget budgetId: UUID?, andPath path: String?) -> URL {
        if let extraPath = path {
            return URL(string: budgetBaseUrl(forBudget: budgetId) + extraPath)!
        }
        
        return URL(string: budgetBaseUrl(forBudget: budgetId))!
    }
}
