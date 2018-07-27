//
//  Payee.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

// Single Payee
struct PayeeResponse: Decodable {
    var wrapper: PayeeWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct PayeeWrapper: Decodable {
    var payee: Payee
}

// Array of Payees
struct PayeesResponse: Decodable {
    var wrapper: PayeesWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct PayeesWrapper: Decodable {
    var payees: [Payee]
}

public struct Payee: Decodable {
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
