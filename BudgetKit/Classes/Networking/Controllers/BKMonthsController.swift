//
//  MonthsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

class BKMonthsController: BKBaseController {
    
    static func getBudgetMonthsList(budgetID: UUID?, completion: @escaping YNABCompletion<[BKMonthSummary]>) {
        let path = initialPath(forBudget: budgetID) + "/months"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKMonthSummariesResponse.self, from: data)
                let months = response.wrapper.months
                completion(.success(months))
            } catch {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getBudgetMonth(budgetID: UUID?, month: String, completion: @escaping YNABCompletion<BKMonthDetail>) {
        let path = initialPath(forBudget: budgetID) + "/months/" + month
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKMonthDetailResponse.self, from: data)
                let month = response.wrapper.month
                completion(.success(month))
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
