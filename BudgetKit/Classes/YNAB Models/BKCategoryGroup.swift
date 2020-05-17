//
//  CategoryGroup.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct BKCategoriesResponse: Decodable {
    var wrapper: BKCategoryGroupsWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKCategoryGroupsWrapper: Decodable {
    var categoryGroups: [BKCategoryGroupWithCategories]
    
    enum CodingKeys: String, CodingKey {
        case categoryGroups = "category_groups"
    }
}

public struct BKCategoryGroup: Decodable {
    public var id: UUID
    public var name: String
    public var isHidden: Bool
    public var isDeleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case isHidden = "hidden"
        case isDeleted = "deleted"
    }
}

public struct BKCategoryGroupWithCategories: Decodable {
    public var id: UUID
    public var name: String
    public var isHidden: Bool
    public var isDeleted: Bool
    public var categories: [BKCategory]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case isHidden = "hidden"
        case isDeleted = "deleted"
        case categories = "categories"
    }
}
