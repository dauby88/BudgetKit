//
//  CategoryGroup.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

struct CategoriesResponse: Decodable {
    var wrapper: CategoryGroupsWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct CategoryGroupsWrapper: Decodable {
    var categoryGroups: [CategoryGroupWithCategories]
    
    enum CodingKeys: String, CodingKey {
        case categoryGroups = "category_groups"
    }
}

public struct CategoryGroup: Decodable {
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

public struct CategoryGroupWithCategories: Decodable {
    public var id: UUID
    public var name: String
    public var isHidden: Bool
    public var isDeleted: Bool
    public var categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case isHidden = "hidden"
        case isDeleted = "deleted"
        case categories = "categories"
    }
}
