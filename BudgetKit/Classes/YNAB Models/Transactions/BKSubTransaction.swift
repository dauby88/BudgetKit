//
//  SubTransaction.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public struct BKSubTransaction: Decodable {
    public var id: UUID
    public var transactionID: UUID
    public var amount: BKMilliunits
    public var memo: String?
    public var payeeID: UUID?
    public var categoryID: UUID?
    /// If a transfer, the account_id which the subtransaction transfers to.
    public var transferAccountID: UUID?
    /// Whether or not the subtransaction has been deleted. Deleted subtransactions will only be included in delta requests.
    public var isDeleted: Bool // TODO: Determine if this and other "isDeleted" properties are actually optional
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case transactionID = "transaction_id"
        case amount = "amount"
        case memo = "memo"
        case payeeID = "payee_id"
        case categoryID = "category_id"
        case transferAccountID = "transfer_account_id"
        case isDeleted = "deleted"
    }
}
