//
//  TransactionDetail.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

// Single Transaction
struct TransactionResponse: Decodable {
    var wrapper: TransactionWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct TransactionWrapper: Decodable {
    var transaction: TransactionDetail
}

// Array of Transactions
struct TransactionsResponse: Decodable {
    var wrapper: TransactionsWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct TransactionsWrapper: Decodable {
    var transactions: [TransactionDetail]
}

public struct TransactionDetail: Decodable {
    public var id: UUID
    public var date: String // TODO: Convert to date
    public var amount: Milliunits
    public var memo: String?
    public var cleared: ClearedStatus
    public var isApproved: Bool
    public var flagColor: FlagColor
    public var accountID: UUID
    public var payeeID: UUID?
    public var categoryID: UUID?
    public var transferAccountID: UUID?
    public var importID: String?
    public var isDeleted: Bool
    public var accountName: String
    public var payeeName: String?
    public var categoryName: String?
    public var subTransactions: [SubTransaction]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case date = "date"
        case amount = "amount"
        case memo = "memo"
        case cleared = "cleared"
        case isApproved = "approved"
        case flagColor = "flag_color"
        case accountID = "account_id"
        case payeeID = "payee_id"
        case categoryID = "category_id"
        case transferAccountID = "transfer_account_id"
        case importID = "import_id"
        case isDeleted = "deleted"
        case accountName = "account_name"
        case payeeName = "payee_name"
        case categoryName = "category_name"
        case subTransactions = "subtransactions"
    }
}
