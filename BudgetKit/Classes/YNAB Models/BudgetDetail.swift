//
//  BudgetDetail.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BudgetDetailResponse: Decodable {
    var wrapper: BudgetDetailWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BudgetDetailWrapper: Decodable {
    var budget: BudgetDetail
}

public struct BudgetDetail: Decodable {
    
    public var id: UUID
    public var name: String
    public var lastModifiedOn: String? // TODO: Convert to Date
    public var currencyFormat: CurrencyFormat
    public var accounts: [Account]
    public var payees: [Payee]
    public var payeeLocations: [PayeeLocation]
    public var categoryGroups: [CategoryGroup]
    public var categories: [Category]
    public var months: [MonthDetail]
    public var transactions: [TransactionSummary]
    public var subTransactions: [SubTransaction]?
    public var scheduledTransactions: [ScheduledTransactionSummary]
    public var scheduledSubTransactions: [ScheduledSubTransaction]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case lastModifiedOn = "last_modified"
        case currencyFormat = "currency_format"
        case accounts = "accounts"
        case payees = "payees"
        case payeeLocations = "payee_locations"
        case categoryGroups = "category_groups"
        case categories = "categories"
        case months = "months"
        case transactions = "transactions"
        case subTransactions = "subtransactions"
        case scheduledTransactions = "scheduled_transactions"
        case scheduledSubTransactions = "scheduled_subtransactions"
    }
}
