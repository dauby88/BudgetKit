//
//  BudgetsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/27/18.
//

import Foundation

class BudgetsController: BaseController {
    
    static func getBudgets(completion: @escaping YNABCompletion<[BudgetSummary]>) {
        let url = URL(string: budgetsBaseUrl())!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BudgetSummaryResponse.self, from: data)
                let budgets = response.wrapper.budgetSummaries
                completion(.success(budgets))
            } catch {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getBudget(id: UUID?, completion: @escaping YNABCompletion<BudgetDetail>) {
        let path = initialPath(forBudget: id)
        let url = URL(string: path, relativeTo: baseURL(forBudget: id))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BudgetDetailResponse.self, from: data)
                let budget = response.wrapper.budget
                completion(.success(budget))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getBudgetSettings(id: UUID, completion: @escaping YNABCompletion<BudgetSettings>) {
        let path = initialPath(forBudget: id) + "/settings"
        let url = URL(string: path, relativeTo: baseURL(forBudget: id))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BudgetSettingsResponse.self, from: data)
                let settings = response.wrapper.settings
                completion(.success(settings))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
}
