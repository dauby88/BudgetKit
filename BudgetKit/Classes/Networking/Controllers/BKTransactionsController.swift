//
//  TransactionsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation


/// If you pass "nil" in place of the budgetID parameter of any of the functions in this struct, it means you are requesting the information from the "default" budget the user selected when they authenticated your app
class BKTransactionsController: BKBaseController {
    
    static func getTransactionList(budgetID: UUID?, completion: @escaping YNABCompletion<[BKTransactionDetail]>) {
        let path = initialPath(forBudget: budgetID) + "/transactions"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKTransactionsResponse.self, from: data)
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
    
    static func postTransaction(_ transaction: BKNewTransaction, budgetID: UUID?, completion: @escaping YNABCompletion<BKTransactionDetail>) {
        let path = initialPath(forBudget: budgetID) + "/transactions"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        do {
            let wrapper = BKNewTransactionWrapper(transaction: transaction)
            let body = try JSONEncoder().encode(wrapper)
            
            let success: ((Data) -> Void) = { data in
                do {
                    let response = try JSONDecoder().decode(BKTransactionResponse.self, from: data)
                    let transaction = response.wrapper.transaction
                    completion(.success(transaction))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            let failure: ((Error) -> Void) = { error in
                completion(.failure(error))
            }
            
            BKWebServiceManager.shared.post(url, body: body, success: success, failure: failure)
        } catch {
            completion(.failure(error))
        }
    }
    
    static func postBulkTransactions(_ transactions: [BKNewTransaction], budgetID: UUID?, completion: @escaping YNABCompletion<BKBulkTransactionIDs>) {
        let path = initialPath(forBudget: budgetID) + "/transactions/bulk"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        do {
            let bulkTransactionsWrapper = BKBulkTransactionsWrapper(transactions: transactions)
            let body = try JSONEncoder().encode(bulkTransactionsWrapper)
            
            let success: ((Data) -> Void) = { data in
                do {
                    let response = try JSONDecoder().decode(BKBulkTransactionResponse.self, from: data)
                    let bulkIDs = response.wrapper.bulk
                    completion(.success(bulkIDs))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            let failure: ((Error) -> Void) = { error in
                completion(.failure(error))
            }
            
            BKWebServiceManager.shared.post(url, body: body, success: success, failure: failure)
        } catch {
            completion(.failure(error))
        }
    }
    
    static func getTransactionListForAccount(budgetID: UUID?, accountID: UUID, completion: @escaping YNABCompletion<[BKTransactionDetail]>) {
        let path = initialPath(forBudget: budgetID) + "/accounts/" + accountID.uuidString + "/transactions"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKTransactionsResponse.self, from: data)
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
    
    static func getTransactionListForCategory(budgetID: UUID?, categoryID: UUID, completion: @escaping YNABCompletion<[BKTransactionDetail]>) {
        let path = initialPath(forBudget: budgetID) + "/categories/" + categoryID.uuidString + "/transactions"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKTransactionsResponse.self, from: data)
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
    
    static func getTransactionListForPayee(budgetID: UUID?, payeeID: UUID, completion: @escaping YNABCompletion<[BKTransactionDetail]>) {
        let path = initialPath(forBudget: budgetID) + "/payees/" + payeeID.uuidString + "/transactions"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKTransactionsResponse.self, from: data)
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
    
    static func getTransaction(budgetID: UUID?, transactionID: UUID, completion: @escaping YNABCompletion<BKTransactionDetail>) {
        let path = initialPath(forBudget: budgetID) + "/transactions/" + transactionID.uuidString
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKTransactionResponse.self, from: data)
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
    
    static func updateTransaction(_ transaction: BKTransactionSummary, budgetID: UUID?, transactionID: UUID, completion: @escaping YNABCompletion<BKTransactionDetail>) {
        let path = initialPath(forBudget: budgetID) + "/transactions/" + transactionID.uuidString
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        do {
            let body = try JSONEncoder().encode(transaction)
            
            let success: ((Data) -> Void) = { data in
                do {
                    let response = try JSONDecoder().decode(BKTransactionResponse.self, from: data)
                    let transaction = response.wrapper.transaction
                    completion(.success(transaction))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            let failure: ((Error) -> Void) = { error in
                completion(.failure(error))
            }
            
            BKWebServiceManager.shared.put(url, body: body, success: success, failure: failure)
        } catch {
            completion(.failure(error))
        }
    }
}
