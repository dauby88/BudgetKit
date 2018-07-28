//
//  BudgetsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/27/18.
//

import Foundation

struct BudgetsController {
    
    static var baseURL: URL {
        let string = API.baseURL + "budgets/"
        return URL(string: string)!
    }
    
    static func getBudgets(completion: @escaping YNABCompletion<[BudgetSummary]>) {
        let url = baseURL
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
    
    static func getBudget(id: UUID, completion: @escaping YNABCompletion<BudgetDetail>) {
        let path = id.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
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
        let path = id.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
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
