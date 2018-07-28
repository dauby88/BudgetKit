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
            let error = YNABError(id: "000", name: "test_error", detail: "Test Error")
            failed(error)
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
    /// Returns authenticated user information.
    public static func getUser(completion: @escaping YNABCompletion<User>) {
        UserController.getUser(completion: completion)
    }
    
    // MARK: - Budgets
    /// Returns budgets list with summary information.
    public static func getBudgetList(completion: @escaping YNABCompletion<[BudgetSummary]>) {
        BudgetsController.getBudgets(completion: completion)
    }
    
    /// Returns a single budget with all related entities. This resource is effectively a full budget export.
    public static func getBudget(id: UUID, completion: @escaping YNABCompletion<BudgetDetail>) {
        BudgetsController.getBudget(id: id, completion: completion)
    }
    
    /// Returns settings for a budget.
    public static func getBudgetSettings(id: UUID, completion: @escaping YNABCompletion<BudgetSettings>) {
        BudgetsController.getBudgetSettings(id: id, completion: completion)
    }
    
    // MARK: - Accounts
    /// Returns all accounts.
    public static func getAccountList(budgetID: UUID, completion: @escaping YNABCompletion<[Account]>) {
        AccountsController.getAccountList(budgetID: budgetID, completion: completion)
    }
    
    /// Returns a single account.
    public static func getAccount(budgetID: UUID, accountID: UUID, completion: @escaping YNABCompletion<Account>) {
        AccountsController.getAccount(budgetID: budgetID, accountID: accountID, completion: completion)
    }
    
    // MARK: - Categories
    /// Returns all categories grouped by category group.
    public static func getCategoryList(budgetID: UUID, completion: @escaping YNABCompletion<[CategoryGroupWithCategories]>) {
        CategoriesController.getCategoryList(budgetID: budgetID, completion: completion)
    }
    
    /// Returns a single category.
    public static func getCategory(budgetID: UUID, categoryID: UUID, completion: @escaping YNABCompletion<Category>) {
        CategoriesController.getCategory(budgetID: budgetID, categoryID: categoryID, completion: completion)
    }
    
    // MARK: - Payees
    /// Returns all payees.
    public static func getPayeeList(budgetID: UUID, completion: @escaping YNABCompletion<[Payee]>) {
        PayeeController.getPayeeList(budgetID: budgetID, completion: completion)
    }
    
    /// Returns single payee.
    public static func getPayee(budgetID: UUID, payeeID: UUID, completion: @escaping YNABCompletion<Payee>) {
        PayeeController.getPayee(budgetID: budgetID, payeeID: payeeID, completion: completion)
    }
    
    // MARK: - Payee Locations
    /// Returns all payee locations.
    public static func getPayeeLocationList(budgetID: UUID, completion: @escaping YNABCompletion<[PayeeLocation]>) {
        PayeeLocationsController.getPayeeLocationList(budgetID: budgetID, completion: completion)
    }
    
    /// Returns a single payee location.
    public static func getPayeeLocation(budgetID: UUID, payeeLocationID: UUID, completion: @escaping YNABCompletion<PayeeLocation>) {
        PayeeLocationsController.getPayeeLocation(budgetID: budgetID, payeeLocationID: payeeLocationID, completion: completion)
    }
    
    /// Returns all payee locations for the specified payee.
    public static func getLocationListForPayee(budgetID: UUID, payeeID: UUID, completion: @escaping YNABCompletion<[PayeeLocation]>) {
        PayeeLocationsController.getLocationListForPayee(budgetID: budgetID, payeeID: payeeID, completion: completion)
    }
    
    // MARK: - Months
    /// Returns all budget months.
    public static func getBudgetMonthsList(budgetID: UUID, completion: @escaping YNABCompletion<[MonthSummary]>) {
        MonthsController.getBudgetMonthsList(budgetID: budgetID, completion: completion)
    }
    
    /// Returns a single budget month.
    public static func getBudgetMonth(budgetID: UUID, month: String, completion: @escaping YNABCompletion<MonthDetail>) {
        MonthsController.getBudgetMonth(budgetID: budgetID, month: month, completion: completion)
    }
    
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
