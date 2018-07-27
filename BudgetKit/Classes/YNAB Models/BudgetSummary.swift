//
//  BudgetSummary.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/17/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BudgetSummaryResponse: Decodable {
    var budgetSummaryWrapper: BudgetSummaryWrapper
    
    enum CodingKeys: String, CodingKey {
        case budgetSummaryWrapper = "data"
    }
}

struct BudgetSummaryWrapper: Decodable {
    var budgetSummaries: [BudgetSummary]
    
    enum CodingKeys: String, CodingKey {
        case budgetSummaries = "budgets"
    }
}

public struct BudgetSummary: Decodable {
    public var id: UUID
    public var name: String
    public var lastModified: Date?
    public var firstMonth: Date
    public var lastMonth: Date
    public var dateFormat: DateFormat?
    public var currencyFormat: CurrencyFormat?
    
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
        self.dateFormat = try? container.decode(DateFormat.self, forKey: .dateFormat)
        self.currencyFormat = try? container.decode(CurrencyFormat.self, forKey: .currencyFormat)
        self.dateFormat = try? container.decode(DateFormat.self, forKey: .dateFormat)
        self.currencyFormat = try? container.decode(CurrencyFormat.self, forKey: .currencyFormat)
        
        // Date Decoding
        // Last Modified Date
        let dateDebugDescription = "Date string does not match format expected by formatter."
        let lastModifiedString = try container.decode(String.self, forKey: .lastModified)
        let iso8610DateFormatter = DateFormatter.iso8601Full
        if let lastModified = iso8610DateFormatter.date(from: lastModifiedString) {
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
