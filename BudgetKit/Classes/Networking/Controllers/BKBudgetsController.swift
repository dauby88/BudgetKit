//
//  BudgetsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/27/18.
//

import Foundation

class BKBudgetsController: BKBaseController {
    
    static func getBudgets(completion: @escaping YNABCompletion<[BKBudgetSummary]>) {
        let url = URL(string: budgetsBaseUrl())!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKBudgetSummaryResponse.self, from: data)
                let budgets = response.wrapper.budgetSummaries
                completion(.success(budgets))
            } catch {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getBudget(id: UUID?, completion: @escaping YNABCompletion<BKBudgetDetail>) {
        let path = initialPath(forBudget: id)
        let url = URL(string: path, relativeTo: baseURL(forBudget: id))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKBudgetDetailResponse.self, from: data)
                let budget = response.wrapper.budget
                completion(.success(budget))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getBudgetSettings(id: UUID, completion: @escaping YNABCompletion<BKBudgetSettings>) {
        let path = initialPath(forBudget: id) + "/settings"
        let url = URL(string: path, relativeTo: baseURL(forBudget: id))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKBudgetSettingsResponse.self, from: data)
                let settings = response.wrapper.settings
                completion(.success(settings))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
}
