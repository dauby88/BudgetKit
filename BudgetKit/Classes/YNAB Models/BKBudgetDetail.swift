//
//  BudgetDetail.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKBudgetDetailResponse: Decodable {
    var wrapper: BKBudgetDetailWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKBudgetDetailWrapper: Decodable {
    var budget: BKBudgetDetail
}

public struct BKBudgetDetail: Decodable {
    
    public var id: UUID
    public var name: String
    public var lastModifiedOn: String? // TODO: Convert to Date
    public var currencyFormat: BKCurrencyFormat
    public var accounts: [BKAccount]
    public var payees: [BKPayee]
    public var payeeLocations: [BKPayeeLocation]
    public var categoryGroups: [BKCategoryGroup]
    public var categories: [BKCategory]
    public var months: [BKMonthDetail]
    public var transactions: [BKTransactionSummary]
    public var subTransactions: [BKSubTransaction]?
    public var scheduledTransactions: [BKScheduledTransactionSummary]
    public var scheduledSubTransactions: [BKScheduledSubTransaction]
    
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
