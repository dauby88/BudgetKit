//
//  MonthDetail.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct MonthDetailResponse: Decodable {
    var wrapper: MonthDetailWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct MonthDetailWrapper: Decodable {
    var month: MonthDetail
}

public struct MonthDetail: Decodable {
    public var month: String
    public var note: String?
    public var toBeBudgeted: Milliunits?
    public var ageOfMoney: Int?
    /// The budget month categories.
    public var categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case month = "month"
        case note = "note"
        case toBeBudgeted = "to_be_budgeted"
        case ageOfMoney = "age_of_money"
        case categories = "categories"
    }
}
