//
//  PayeeController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

class BKPayeeController: BKBaseController {
    
    static func getPayeeList(budgetID: UUID?, completion: @escaping YNABCompletion<[BKPayee]>) {
        let path = initialPath(forBudget: budgetID) + "/payees"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKPayeeListResponse.self, from: data)
                let payees = response.wrapper.payees
                completion(.success(payees))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getPayee(budgetID: UUID?, payeeID: UUID, completion: @escaping YNABCompletion<BKPayee>) {
        let path = initialPath(forBudget: budgetID) + "/payees/" + payeeID.uuidString
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKPayeeResponse.self, from: data)
                let payee = response.wrapper.payee
                completion(.success(payee))
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
