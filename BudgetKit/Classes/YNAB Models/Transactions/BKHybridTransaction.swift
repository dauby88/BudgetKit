//
//  HybridTransaction.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/19/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKHybridTransactionsResponse: Decodable {
    var wrapper: BKHybridTransactionsWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKHybridTransactionsWrapper: Decodable {
    var transactions: [BKHybridTransaction]
}

public struct BKHybridTransaction: Decodable {
    public var id: UUID
    public var date: String // TODO: Convert to date
    public var amount: BKMilliunits
    public var memo: String?
    public var cleared: BKClearedStatus
    public var isApproved: Bool
    public var flagColor: BKFlagColor?
    public var accountID: UUID
    public var payeeID: UUID?
    public var categoryID: UUID?
    public var transferAccountID: UUID?
    public var importID: String?
    public var isDeleted: Bool
    public var type: BKTransactionType
    /// For subtransaction types, this is the id of the pararent transaction. For transaction types, this id will be always be nil.
    public var parentTransactionID: UUID?
    public var accountName: String
    public var payeeName: String?
    public var categoryName: String?
    
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
        case type = "type"
        case parentTransactionID = "parent_transaction_id"
        case accountName = "account_name"
        case payeeName = "payee_name"
        case categoryName = "category_name"
    }
}
