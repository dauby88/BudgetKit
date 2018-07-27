//
//  User.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct UserResponse: Decodable {
    var userWrapper: UserWrapper
    
    enum CodingKeys: String, CodingKey {
        case userWrapper = "data"
    }
}

struct UserWrapper: Decodable {
    var user: User
}

public struct User: Decodable {
    public var id: UUID
}
