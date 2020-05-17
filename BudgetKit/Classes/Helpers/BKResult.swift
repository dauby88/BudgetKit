//
//  Result.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/24/18.
//

import Foundation

public enum BKResult<T> {
    case success(T)
    case failure(Error)
}
