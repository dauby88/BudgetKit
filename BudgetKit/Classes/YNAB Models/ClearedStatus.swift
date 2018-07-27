//
//  ClearedStatus.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

public enum ClearedStatus: String, Decodable {
    case cleared, uncleared, reconciled
    
    public var description: String {
        switch self {
        case .cleared:
            return "Cleared"
        case .uncleared:
            return "Uncleared"
        case .reconciled:
            return "Reconciled"
        }
    }
}
