//
//  Payee.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

// Single Payee
struct BKPayeeResponse: Decodable {
    var wrapper: BKPayeeWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKPayeeWrapper: Decodable {
    var payee: BKPayee
}

// Array of Payees
struct BKPayeeListResponse: Decodable {
    var wrapper: BKPayeeListWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKPayeeListWrapper: Decodable {
    var payees: [BKPayee]
}

public struct BKPayee: Decodable {
    public var id: UUID
    public var name: String
    public var transferAccountID: UUID?
    public var isDeleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case transferAccountID = "transfer_account_id"
        case isDeleted = "deleted"
    }
}
