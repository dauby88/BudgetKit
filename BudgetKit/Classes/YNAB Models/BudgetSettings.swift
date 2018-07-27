//
//  BudgetSettings.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BudgetSettingsResponse: Decodable {
    var wrapper: BudgetSettingsWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BudgetSettingsWrapper: Decodable {
    var settings: BudgetSettings
}

public struct BudgetSettings: Decodable {
    public var dateFormat: DateFormat
    public var currencyFormat: CurrencyFormat
    
    enum CodingKeys: String, CodingKey {
        case dateFormat = "date_format"
        case currencyFormat = "currency_format"
    }
}
