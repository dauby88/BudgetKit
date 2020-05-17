//
//  User.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKUserResponse: Decodable {
    var wrapper: BKUserWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKUserWrapper: Decodable {
    var user: BKUser
}

public struct BKUser: Decodable {
    public var id: UUID
}
