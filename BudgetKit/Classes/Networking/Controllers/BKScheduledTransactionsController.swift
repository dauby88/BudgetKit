//
//  ScheduledTransactionsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

class BKScheduledTransactionsController: BKBaseController {
    
    static func getScheduledTransactionList(budgetID: UUID?, completion: @escaping YNABCompletion<[BKScheduledTransactionDetail]>) {
        let path = initialPath(forBudget: budgetID) + "/transactions"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKScheduledTransactionListResponse.self, from: data)
                let transactions = response.wrapper.transactions
                completion(.success(transactions))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getScheduledTransaction(budgetID: UUID?, transactionID: UUID, completion: @escaping YNABCompletion<BKScheduledTransactionDetail>) {
        let path = initialPath(forBudget: budgetID) + "/transactions/" + transactionID.uuidString
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKScheduledTransactionResponse.self, from: data)
                let transaction = response.wrapper.transaction
                completion(.success(transaction))
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
