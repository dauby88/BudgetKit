//
//  MonthSummary.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct MonthSummariesResponse: Decodable {
    var wrapper: MonthSummariesWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct MonthSummariesWrapper: Decodable {
    var months: [MonthSummary]
}

public struct MonthSummary: Decodable {
    public var month: String
    public var note: String?
    public var toBeBudgeted: Milliunits?
    public var ageOfMoney: Int?
    
    enum CodingKeys: String, CodingKey {
        case month = "month"
        case note = "note"
        case toBeBudgeted = "to_be_budgeted"
        case ageOfMoney = "age_of_money"
    }
}
