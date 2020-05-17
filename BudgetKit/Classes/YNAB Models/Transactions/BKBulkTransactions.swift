//
//  BulkTransactions.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/19/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKBulkTransactionResponse: Decodable {
    var wrapper: BKBulkTransactionWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKBulkTransactionWrapper: Decodable {
    var bulk: BKBulkTransactionIDs
}

public struct BKBulkTransactionIDs: Decodable {
    public var transactionIDs: [String]
    public var duplicateImportIDs: [String]
    
    enum CodingKeys: String, CodingKey {
        case transactionIDs = "transaction_ids"
        case duplicateImportIDs = "duplicate_import_ids"
    }
}

public struct BKBulkTransactions: Decodable {
    public var transactions: [BKSaveTransaction]
}
