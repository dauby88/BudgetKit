//
//  Category.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct CategoryResponse: Decodable {
    var wrapper: CategoryWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct CategoryWrapper: Decodable {
    var category: Category
}

public struct Category: Decodable {
    public var id: UUID
    public var groupID: UUID
    public var name: String
    public var isHidden: Bool
    public var originalGroupID: UUID?
    public var note: String?
    public var budgeted: Milliunits
    public var activity: Milliunits
    public var balance: Milliunits
    public var goalType: GoalType?
    public var goalCreationMonth: String?
    public var goalTarget: Milliunits?
    public var goalTargetMonth: String?
    public var goalPercentageComplete: Int?
    public var isDeleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case groupID = "category_group_id"
        case name = "name"
        case isHidden = "hidden"
        case originalGroupID = "original_category_group_id"
        case note = "note"
        case budgeted = "budgeted"
        case activity = "activity"
        case balance = "balance"
        case goalType = "goal_type"
        case goalCreationMonth = "goal_creation_month"
        case goalTarget = "goal_target"
        case goalTargetMonth = "goal_target_month"
        case goalPercentageComplete = "goal_percentage_complete"
        case isDeleted = "deleted"
    }
}
