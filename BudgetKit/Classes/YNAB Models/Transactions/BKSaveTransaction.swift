//
//  SaveTransaction.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/19/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKSaveTransactionWrapper: Decodable {
    var transaction: BKSaveTransaction
}

public struct BKSaveTransaction: Decodable {
    public var accountID: UUID
    public var date: String // TODO: Convert to date
    public var amount: BKMilliunits
    public var payeeID: UUID?
    public var payeeName: String?
    public var categoryID: UUID?
    public var memo: String?
    public var cleared: BKClearedStatus
    public var isApproved: Bool
    public var flagColor: BKFlagColor?
    public var importID: String?
    
    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case date = "date"
        case amount = "amount"
        case payeeID = "payee_id"
        case payeeName = "payee_name"
        case categoryID = "category_id"
        case memo = "memo"
        case cleared = "cleared"
        case isApproved = "approved"
        case flagColor = "flag_color"
        case importID = "import_id"
    }
}
