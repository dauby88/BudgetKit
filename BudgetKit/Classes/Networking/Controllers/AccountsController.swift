//
//  AccountsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/27/18.
//

import Foundation

struct AccountsController {
    
    static var baseURL: URL {
        let string = API.baseURL + "budgets/"
        return URL(string: string)!
    }
    
    static func getAccountList(budgetID: UUID, completion: @escaping YNABCompletion<[Account]>) {
        var path = budgetID.uuidString
        path += "/accounts"
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(AccountsResponse.self, from: data)
                let accounts = response.wrapper.accounts
                completion(.success(accounts))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getAccount(budgetID: UUID, accountID: UUID, completion: @escaping YNABCompletion<Account>) {
        var path = budgetID.uuidString
        path += "/accounts/"
        path += accountID.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(AccountResponse.self, from: data)
                let account = response.wrapper.account
                completion(.success(account))
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
