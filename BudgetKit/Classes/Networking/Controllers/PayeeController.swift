//
//  PayeeController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

class PayeeController: BaseController {
    
    static func getPayeeList(budgetID: UUID?, completion: @escaping YNABCompletion<[Payee]>) {
        let url = createUrl(forBudget: budgetID, andPath: "/payees")
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(PayeeListResponse.self, from: data)
                let payees = response.wrapper.payees
                completion(.success(payees))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getPayee(budgetID: UUID?, payeeID: UUID, completion: @escaping YNABCompletion<Payee>) {
        let url = createUrl(forBudget: budgetID, andPath: "/payees/" + payeeID.uuidString)
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(PayeeResponse.self, from: data)
                let payee = response.wrapper.payee
                completion(.success(payee))
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
