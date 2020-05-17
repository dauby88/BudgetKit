//
//  TransactionSummary.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public struct BKTransactionSummary: Codable {
    public var id: UUID
    public var date: String // TODO: Convert to date
    public var amount: BKMilliunits
    public var memo: String?
    public var cleared: BKClearedStatus
    /// Whether or not the transaction is approved.
    public var isApproved: Bool
    public var flagColor: BKFlagColor?
    public var accountID: UUID
    public var payeeID: UUID?
    public var categoryID: UUID?
    public var transferAccountID: UUID?
    /// If the Transaction was imported, this field is a unique (by account) import identifier. If this transaction was imported through File Based Import or Direct Import and not through the API, the import_id will have the format: 'YNAB:[milliunit_amount]:[iso_date]:[occurrence]'. For example, a transaction dated 2015-12-30 in the amount of -$294.23 USD would have an import_id of 'YNAB:-294230:2015-12-30:1’. If a second transaction on the same account was imported and had the same date and same amount, its import_id would be 'YNAB:-294230:2015-12-30:2’.
    public var importID: String? // TODO: fix based on comments above
    /// Whether or not the transaction has been deleted. Deleted transactions will only be included in delta requests.
    public var isDeleted: Bool
    
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
    }
}

