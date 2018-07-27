//
//  YNAB.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/21/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public struct YNAB {
    // MARK: - Authentication
    
    /// Standard method for logging in to YNAB.
    public static func login(clientID: String, redirectURI: String, state: String?, authenticated: @escaping (() -> Void), failed: @escaping ((Error) -> Void)) {
        AuthenticationManager.shared.login(clientID: clientID, redirectURI: redirectURI, state: state, authenticated: authenticated, failed: failed)
    }
    
    /// Login using your personal access token for testing. Setting the shouldFail parameter to true will trigger the failed closure with a test error. Otherwise the call will always succeed and further calls to the API will use the access token.
    public static func login(personalAccessToken: String, shouldFail: Bool = false, authenticated: (() -> Void), failed: @escaping ((Error) -> Void)) {
        AuthenticationManager.shared.login(personalAccessToken: personalAccessToken)
        if shouldFail {
            failed(YNABAPIError.testError)
        } else {
            authenticated()
        }
    }
    
    /// Returns whether any user is currently authenticated. Use this to check for authentication without having to make an API call that returns an authentication failed error.
    public static var isAuthenticated: Bool {
        return AuthenticationManager.shared.isAuthenticated
    }
    
    /// Exact time of access token expiration. Use this to anticipate authentication failed errors if the expiration time might pass during the user's current session.
    public static var authenticationExpiration: Date? {
        return AuthenticationManager.shared.accessTokenExpiration
    }
    
    /// Since YNAB does not provide a logout endpoint, this method simply removes the authentication credentials (access token) and future calls to the YNAB api will return an authentication failed error.
    public static func logout() {
        AuthenticationManager.shared.logout()
    }
    
    // MARK: - User
    public static func getUser(completion: @escaping ((Result<User>) -> Void)) {
        UserController.getUser(completion: completion)
    }
    
    // MARK: - Budgets
    public static func getBudgetList() {}
    
    public static func getBudget() {}
    
    public static func getBudgetSettings() {}
    
    // MARK: - Accounts
    public static func getAccountList() {}
    
    public static func getAccount() {}
    
    // MARK: - Categories
    public static func getCategoryList() {}
    
    public static func getCategory() {}
    
    // MARK: - Payees
    public static func getPayeeList() {}
    
    public static func getPayee() {}
    
    // MARK: - Payee Locations
    public static func getPayeeLocationList() {}
    
    public static func getPayeeLocation() {}
    
    public static func getLocationsForPayee() {}
    
    // MARK: - Months
    public static func getBudgetMonthList() {}
    
    public static func getBudgetMonth() {}
    
    // MARK: - Transactions
    public static func getTransactionList() {}
    
    public static func postNewTransaction() {}
    
    public static func postBulkTransactions() {}
    
    public static func getTransactionsByAccount() {}
    
    public static func getTransactionsByCategory() {}
    
    public static func getTransactionsByPayee() {}
    
    public static func getTransaction() {}
    
    public static func updateTransaction() {}
    
    // MARK: - Scheduled Transactions
    
    public static func getScheduledTransactionList() {}
    
    public static func getScheduledTransaction() {}
}
