//
//  MonthsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

struct MonthsController {
    
    static var baseURL: URL {
        let string = API.baseURL + "budgets/"
        return URL(string: string)!
    }
    
    static func getBudgetMonthsList(budgetID: UUID, completion: @escaping YNABCompletion<[MonthSummary]>) {
        var path = budgetID.uuidString
        path += "/months"
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(MonthSummariesResponse.self, from: data)
                let months = response.wrapper.months
                completion(.success(months))
            } catch {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getBudgetMonth(budgetID: UUID, month: String, completion: @escaping YNABCompletion<MonthDetail>) {
        var path = budgetID.uuidString
        path += "/months/"
        path += month
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(MonthDetailResponse.self, from: data)
                let month = response.wrapper.month
                completion(.success(month))
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
