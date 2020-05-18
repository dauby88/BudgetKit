//
//  YNABError.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/24/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct YNABErrorWrapper: Decodable {
    var error: YNABError
}

public struct YNABError: Error, Decodable {
    var id: String
    var name: String
    var detail: String
}

/*
enum YNABError: Error {
    case badRequest
    case notAuthorized(detail: String)
    case subscriptionLapsed
    case trialExpired
    case notFound
    case resourceNotFound
    case tooManyRequests
    case internalServiceError
}
*/
