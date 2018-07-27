//
//  BulkTransactions.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/19/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BulkResponse: Decodable {
    var wrapper: BulkIDWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BulkIDWrapper: Decodable {
    var bulk: BulkIDs
}

public struct BulkIDs: Decodable {
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
