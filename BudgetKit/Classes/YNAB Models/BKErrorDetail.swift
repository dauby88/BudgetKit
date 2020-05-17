//
//  ErrorDetail.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKErrorResponse: Decodable {
    var errorDetail: BKErrorDetail
    
    enum CodingKeys: String, CodingKey {
        case errorDetail = "error"
    }
}

struct BKErrorDetail: Decodable {
    var id: String
    var name: String
    var detail: String
}
