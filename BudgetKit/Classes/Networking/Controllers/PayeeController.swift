//
//  PayeeController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

struct PayeeController {
    
    static var baseURL: URL {
        let string = API.baseURL + "budgets/"
        return URL(string: string)!
    }
    
    static func getPayeeList(budgetID: UUID, completion: @escaping YNABCompletion<[Payee]>) {
        var path = budgetID.uuidString
        path += "/payees"
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(PayeesResponse.self, from: data)
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
    
    static func getPayee(budgetID: UUID, payeeID: UUID, completion: @escaping YNABCompletion<Payee>) {
        var path = budgetID.uuidString
        path += "/payees/"
        path += payeeID.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
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
