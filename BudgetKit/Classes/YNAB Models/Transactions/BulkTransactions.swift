//
//  BulkTransactions.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/19/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BulkTransactionResponse: Decodable {
    var wrapper: BulkTransactionWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BulkTransactionWrapper: Decodable {
    var bulk: BulkTransactionIDs
}

public struct BulkTransactionIDs: Decodable {
    public var transactionIDs: [String]
    public var duplicateImportIDs: [String]
    
    enum CodingKeys: String, CodingKey {
        case transactionIDs = "transaction_ids"
        case duplicateImportIDs = "duplicate_import_ids"
    }
}

public struct BulkTransactions: Decodable {
    public var transactions: [SaveTransaction]
}
