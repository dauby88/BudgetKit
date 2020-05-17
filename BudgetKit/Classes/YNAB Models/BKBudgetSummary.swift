//
//  BudgetSummary.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/17/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKBudgetSummaryResponse: Decodable {
    var wrapper: BKBudgetSummaryWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKBudgetSummaryWrapper: Decodable {
    var budgetSummaries: [BKBudgetSummary]
    
    enum CodingKeys: String, CodingKey {
        case budgetSummaries = "budgets"
    }
}

public struct BKBudgetSummary: Decodable {
    public var id: UUID
    public var name: String
    public var lastModified: Date? // TODO: Update to date
    public var firstMonth: Date
    public var lastMonth: Date
    public var dateFormat: BKDateFormat?
    public var currencyFormat: BKCurrencyFormat?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case lastModified = "last_modified_on"
        case firstMonth = "first_month"
        case lastMonth = "last_month"
        case dateFormat = "date_format"
        case currencyFormat = "currency_format"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.dateFormat = try? container.decode(BKDateFormat.self, forKey: .dateFormat)
        self.currencyFormat = try? container.decode(BKCurrencyFormat.self, forKey: .currencyFormat)
        self.dateFormat = try? container.decode(BKDateFormat.self, forKey: .dateFormat)
        self.currencyFormat = try? container.decode(BKCurrencyFormat.self, forKey: .currencyFormat)
        
        // Date Decoding
        // Last Modified Date
        let dateDebugDescription = "Date string does not match format expected by formatter."
        let lastModifiedString = try container.decode(String.self, forKey: .lastModified)
        let ynabFormatter = DateFormatter.ynab
        if let lastModified = ynabFormatter.date(from: lastModifiedString) {
            self.lastModified = lastModified
        } else {
            throw DecodingError.dataCorruptedError(forKey: .lastModified, in: container, debugDescription: dateDebugDescription)
        }
        
        // First and Last Month
        let firstMonthString = try container.decode(String.self, forKey: .firstMonth)
        let yyyyMMddFormatter = DateFormatter.yyyyMMdd
        if let firstMonth = yyyyMMddFormatter.date(from: firstMonthString) {
            self.firstMonth = firstMonth
        } else {
            throw DecodingError.dataCorruptedError(forKey: .firstMonth, in: container, debugDescription: dateDebugDescription)
        }
        
        let lastMonthString = try container.decode(String.self, forKey: .lastMonth)
        if let lastMonth = yyyyMMddFormatter.date(from: lastMonthString) {
            self.lastMonth = lastMonth
        } else {
            throw DecodingError.dataCorruptedError(forKey: .lastMonth, in: container, debugDescription: dateDebugDescription)
        }
    }
}