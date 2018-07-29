//
//  TransactionsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

struct TransactionsController {
    
    static var baseURL: URL {
        let string = API.baseURL + "budgets/"
        return URL(string: string)!
    }
    
    static func getTransactionList(budgetID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        var path = budgetID.uuidString
        path += "/transactions"
        let url = URL(string: path, relativeTo: baseURL)!
        
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
    
    static func postTransaction(_ transaction: TransactionSummary, budgetID: UUID, completion: @escaping YNABCompletion<TransactionDetail>) {
        var path = budgetID.uuidString
        path += "/transactions"
        let url = URL(string: path, relativeTo: baseURL)!
        
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
            
            WebServiceManager.shared.post(url, body: body, success: success, failure: failure)
        } catch {
            completion(.failure(error))
        }
    }
    
    static func postBulkTransactions(_ transactions: [TransactionSummary], budgetID: UUID, completion: @escaping YNABCompletion<BulkIDs>) {
        var path = budgetID.uuidString
        path += "/transactions"
        let url = URL(string: path, relativeTo: baseURL)!
        
        do {
            let bulkTransactionsWrapper = BulkTransactionsWrapper(transactions: transactions)
            let body = try JSONEncoder().encode(bulkTransactionsWrapper)
            
            let success: ((Data) -> Void) = { data in
                do {
                    let response = try JSONDecoder().decode(BulkResponse.self, from: data)
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
    
    static func getTransactionListForAccount(budgetID: UUID, accountID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        var path = budgetID.uuidString
        path += "/accounts/"
        path += accountID.uuidString
        path += "/transactions"
        let url = URL(string: path, relativeTo: baseURL)!
        
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
    
    static func getTransactionListForCategory(budgetID: UUID, categoryID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        var path = budgetID.uuidString
        path += "/categories/"
        path += categoryID.uuidString
        path += "/transactions"
        let url = URL(string: path, relativeTo: baseURL)!
        
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
    
    static func getTransactionListForPayee(budgetID: UUID, payeeID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>) {
        var path = budgetID.uuidString
        path += "/payees/"
        path += payeeID.uuidString
        path += "/transactions"
        let url = URL(string: path, relativeTo: baseURL)!
        
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
    
    static func getTransaction(budgetID: UUID, transactionID: UUID, completion: @escaping YNABCompletion<TransactionDetail>) {
        var path = budgetID.uuidString
        path += "/transactions/"
        path += transactionID.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
        
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
    
    static func updateTransaction(_ transaction: TransactionSummary, budgetID: UUID, transactionID: UUID, completion: @escaping YNABCompletion<TransactionDetail>) {
        var path = budgetID.uuidString
        path += "/transactions/"
        path += transactionID.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
        
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
