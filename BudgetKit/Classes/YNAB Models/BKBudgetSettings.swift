//
//  BudgetSettings.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKBudgetSettingsResponse: Decodable {
    var wrapper: BKBudgetSettingsWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKBudgetSettingsWrapper: Decodable {
    var settings: BKBudgetSettings
}

public struct BKBudgetSettings: Decodable {
    public var dateFormat: BKDateFormat
    public var currencyFormat: BKCurrencyFormat
    
    enum CodingKeys: String, CodingKey {
        case dateFormat = "date_format"
        case currencyFormat = "currency_format"
    }
}
