//
//  CurrencyFormat.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public struct BKCurrencyFormat: Decodable {
    public var isoCode: String
    public var exampleFormat: String
    public var decimalDigits: Int
    public var decimalSeparator: String
    public var symbolFirst: Bool
    public var groupSeparator: String
    public var currencySymbol: String
    public var displaySymbol: Bool
    
    enum CodingKeys: String, CodingKey {
        case isoCode = "iso_code"
        case exampleFormat = "example_format"
        case decimalDigits = "decimal_digits"
        case decimalSeparator = "decimal_separator"
        case symbolFirst = "symbol_first"
        case groupSeparator = "group_separator"
        case currencySymbol = "currency_symbol"
        case displaySymbol = "display_symbol"
    }
}
