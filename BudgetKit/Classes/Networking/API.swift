//
//  API.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/24/18.
//

import Foundation

public typealias YNABCompletion<T> = ((Result<T>) -> Void)

struct API {
    static var baseURL: String {
        return "https://api.youneedabudget.com/v1/"
    }
}
