//
//  NewTransaction.swift
//  BudgetKit
//
//  Created by TQL Mobile on 8/19/18.
//

import Foundation

struct BKBulkTransactionsWrapper: Encodable {
    var transactions: [BKNewTransaction]
}

struct BKNewTransactionWrapper: Encodable {
    var transaction: BKNewTransaction
}

public struct BKNewTransaction: Encodable {
    var accountID: UUID
    var date: String // TODO: Convert to Date
    var amount: BKMilliunits
    var payeeID: UUID?
    var payeeName: String?
    var categoryID: UUID?
    var memo: String?
    var status: BKClearedStatus
    var approved: Bool
    var flagColor: BKFlagColor?
    var importID: UUID?
    
    public init(accountID: UUID, date: String, amount: BKMilliunits, payeeID: UUID?, payeeName: String?, categoryID: UUID?, memo: String?, status: BKClearedStatus, approved: Bool, flagColor: BKFlagColor?, importID: UUID?) {
        self.accountID = accountID
        self.date = date
        self.amount = amount
        self.payeeID = payeeID
        self.payeeName = payeeName
        self.categoryID = categoryID
        self.memo = memo
        self.status = status
        self.approved = approved
        self.flagColor = flagColor
        self.importID = importID
    }

    
    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case date = "date"
        case amount = "amount"
        case payeeID = "payee_id"
        case payeeName = "payee_name"
        case categoryID = "category_id"
        case memo = "memo"
        case status = "cleared"
        case approved = "approved"
        case flagColor = "flag_color"
        case importID = "import_id"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accountID.uuidString.lowercased(), forKey: .accountID)
        try container.encode(date, forKey: .date)
        try container.encode(amount, forKey: .amount)
        try container.encode(payeeID?.uuidString.lowercased(), forKey: .payeeID)
        try container.encode(payeeName, forKey: .payeeName)
        try container.encode(categoryID?.uuidString.lowercased(), forKey: .categoryID)
        try container.encode(memo, forKey: .memo)
        try container.encode(status, forKey: .status)
        try container.encode(approved, forKey: .approved)
        try container.encode(flagColor, forKey: .flagColor)
        try container.encode(importID?.uuidString.lowercased(), forKey: .importID)
    }
}

