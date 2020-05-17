//
//  AccountsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/27/18.
//

import Foundation

class BKAccountsController: BKBaseController {
    
    static func getAccountList(budgetID: UUID?, completion: @escaping YNABCompletion<[BKAccount]>) {
        let path = initialPath(forBudget: budgetID) + "/accounts"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKAccountListResponse.self, from: data)
                let accounts = response.wrapper.accounts
                completion(.success(accounts))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getAccount(budgetID: UUID?, accountID: UUID, completion: @escaping YNABCompletion<BKAccount>) {
        let path = initialPath(forBudget: budgetID) + "/accounts/" + accountID.uuidString
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKAccountResponse.self, from: data)
                let account = response.wrapper.account
                completion(.success(account))
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
