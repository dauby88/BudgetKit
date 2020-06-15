//
//  TransactionsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation


/// If you pass "nil" in place of the budgetID parameter of any of the functions in this struct, it means you are requesting the information from the "default" budget the user selected when they authenticated your app
class TransactionsController: BaseController {
    
    static func getTransactionList(budgetID: UUID?, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        let url = createUrl(forBudget: budgetID, andPath: "/transactions")
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(TransactionsResponse.self, from: data)
                let transactions = response.wrapper.transactions
                completion(.success(transactions))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func postTransaction(_ transaction: NewTransaction, budgetID: UUID?, completion: @escaping YNABCompletion<TransactionDetail>) {
        let url = createUrl(forBudget: budgetID, andPath: "/transactions")
        
        do {
            let wrapper = NewTransactionWrapper(transaction: transaction)
            let body = try JSONEncoder().encode(wrapper)
            
            let success: ((Data) -> Void) = { data in
                do {
                    let response = try JSONDecoder().decode(TransactionResponse.self, from: data)
                    let transaction = response.wrapper.transaction
                    completion(.success(transaction))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            let failure: ((Error) -> Void) = { error in
                completion(.failure(error))
            }
            
            WebServiceManager.shared.post(url, body: body, success: success, failure: failure)
        } catch {
            completion(.failure(error))
        }
    }
    
    static func postBulkTransactions(_ transactions: [NewTransaction], budgetID: UUID?, completion: @escaping YNABCompletion<BulkTransactionIDs>) {
        let url = createUrl(forBudget: budgetID, andPath: "/transactions/bulk")
        
        do {
            let bulkTransactionsWrapper = BulkTransactionsWrapper(transactions: transactions)
            let body = try JSONEncoder().encode(bulkTransactionsWrapper)
            
            let success: ((Data) -> Void) = { data in
                do {
                    let response = try JSONDecoder().decode(BulkTransactionResponse.self, from: data)
                    let bulkIDs = response.wrapper.bulk
                    completion(.success(bulkIDs))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            let failure: ((Error) -> Void) = { error in
                completion(.failure(error))
            }
            
            WebServiceManager.shared.post(url, body: body, success: success, failure: failure)
        } catch {
            completion(.failure(error))
        }
    }
    
    static func getTransactionListForAccount(budgetID: UUID?, accountID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        let url = createUrl(forBudget: budgetID, andPath: "/accounts/" + accountID.uuidString + "/transactions")
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(TransactionsResponse.self, from: data)
                let transactions = response.wrapper.transactions
                completion(.success(transactions))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getTransactionListForCategory(budgetID: UUID?, categoryID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        let url = createUrl(forBudget: budgetID, andPath: "/categories/" + categoryID.uuidString + "/transactions")
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(TransactionsResponse.self, from: data)
                let transactions = response.wrapper.transactions
                completion(.success(transactions))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getTransactionListForPayee(budgetID: UUID?, payeeID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        let url = createUrl(forBudget: budgetID, andPath: "/payees/" + payeeID.uuidString + "/transactions")
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(TransactionsResponse.self, from: data)
                let transactions = response.wrapper.transactions
                completion(.success(transactions))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getTransaction(budgetID: UUID?, transactionID: UUID, completion: @escaping YNABCompletion<TransactionDetail>) {
        let url = createUrl(forBudget: budgetID, andPath: "/transactions/" + transactionID.uuidString)
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(TransactionResponse.self, from: data)
                let transaction = response.wrapper.transaction
                completion(.success(transaction))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func updateTransaction(_ transaction: TransactionSummary, budgetID: UUID?, transactionID: UUID, completion: @escaping YNABCompletion<TransactionDetail>) {
        let url = createUrl(forBudget: budgetID, andPath: "/transactions/" + transactionID.uuidString)
        
        do {
            let body = try JSONEncoder().encode(transaction)
            
            let success: ((Data) -> Void) = { data in
                do {
                    let response = try JSONDecoder().decode(TransactionResponse.self, from: data)
                    let transaction = response.wrapper.transaction
                    completion(.success(transaction))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            let failure: ((Error) -> Void) = { error in
                completion(.failure(error))
            }
            
            WebServiceManager.shared.put(url, body: body, success: success, failure: failure)
        } catch {
            completion(.failure(error))
        }
    }
}
