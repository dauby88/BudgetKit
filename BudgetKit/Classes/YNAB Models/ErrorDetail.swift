//
//  ErrorDetail.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable {
    var errorDetail: ErrorDetail
    
    enum CodingKeys: String, CodingKey {
        case errorDetail = "error"
    }
}

struct ErrorDetail: Decodable {
    var id: String
    var name: String
    var detail: String
}
