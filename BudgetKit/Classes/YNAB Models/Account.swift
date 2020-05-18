//
//  Account.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public enum AccountType: String, Decodable {
    case checking
    case savings
    case cash
    case creditCard
    case lineOfCredit
    case otherAsset
    case otherLiability
    case payPal
    case merchantAccount
    case investmentAccount
    case mortgage
    
    var description: String {
        switch self {
        case .checking:
            return "Checking"
        case .savings:
            return "Savings"
        case .cash:
            return "Cash"
        case .creditCard:
            return "Credit Card"
        case .lineOfCredit:
            return "Line of Credit"
        case .otherAsset:
            return "Other ASset"
        case .otherLiability:
            return "Other Liability"
        case .payPal:
            return "PayPal"
        case .merchantAccount:
            return "Merchant Account"
        case .investmentAccount:
            return "Investment Account"
        case .mortgage:
            return "Mortgage"
        }
    }
    // TODO: Deprecate payPal, merchantAccount, investmentAccount, and mortgage types
}

// Single Account

struct AccountResponse: Decodable {
    var wrapper: AccountWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct AccountWrapper: Decodable {
    var account: Account
}

// Array of Accounts

struct AccountListResponse: Decodable {
    var wrapper: AccountListWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct AccountListWrapper: Decodable {
    var accounts: [Account]
}

public struct Account: Decodable {
    public var id: UUID
    public var name: String
    public var type: AccountType
    public var isOnBudget: Bool
    public var isClosed: Bool
    public var note: String?
    public var balance: Milliunits
    public var clearedBalance: Milliunits
    public var unclearedBalance: Milliunits
    public var isDeleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case isOnBudget = "on_budget"
        case isClosed = "closed"
        case note = "note"
        case balance = "balance"
        case clearedBalance = "cleared_balance"
        case unclearedBalance = "uncleared_balance"
        case isDeleted = "deleted"
    }
}
