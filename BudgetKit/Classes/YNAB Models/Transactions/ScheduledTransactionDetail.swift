//
//  ScheduledTransactionSummary.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct ScheduledTransactionDetail: Decodable {
    public var id: UUID
    /// The first date for which the Scheduled Transaction was scheduled.
    public var firstDate: String // TODO: Convert to date
    /// The next date for which the Scheduled Transaction is scheduled.
    public var nextDate: String // TODO: Convert to date
    public var frequency: TransactionFrequency
    public var amount: Milliunits
    public var memo: String?
    public var flagColor: FlagColor
    public var accountID: UUID
    public var payeeID: UUID?
    public var categoryID: UUID?
    public var transferAccountID: UUID?
    public var isDeleted: Bool
    public var accountName: String
    public var payeeName: String?
    public var categoryName: String?
    /// If a split scheduled transaction, the subtransactions.
    public var subTransactions: [ScheduledSubTransaction]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstDate = "date_first"
        case nextDate = "date_next"
        case frequency = "frequency"
        case amount = "amount"
        case memo = "memo"
        case flagColor = "flag_color"
        case accountID = "account_id"
        case payeeID = "payee_id"
        case categoryID = "category_id"
        case transferAccountID = "transfer_account_id"
        case isDeleted = "deleted"
        case accountName = "account_name"
        case payeeName = "payee_name"
        case categoryName = "category_name"
        case subTransactions = "subtransactions"
    }
}
