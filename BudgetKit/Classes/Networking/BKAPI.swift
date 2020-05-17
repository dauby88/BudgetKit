//
//  API.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/24/18.
//

import Foundation

public typealias YNABCompletion<T> = ((BKResult<T>) -> Void)

struct BKAPI {
    static var baseURL: String {
        return "https://api.youneedabudget.com/v1/"
    }
}
