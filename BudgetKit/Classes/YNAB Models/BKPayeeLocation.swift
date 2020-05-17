//
//  PayeeLocation.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

// Single Payee Location
struct BKPayeeLocationResponse: Decodable {
    var wrapper: BKPayeeLocationWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKPayeeLocationWrapper: Decodable {
    var payeeLocation: BKPayeeLocation
    
    enum CodingKeys: String, CodingKey {
        case payeeLocation = "payee_location"
    }
}

// Array of Payee Locations
struct BKPayeeLocationListResponse: Decodable {
    var wrapper: BKPayeeLocationListWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct BKPayeeLocationListWrapper: Decodable {
    var payeeLocations: [BKPayeeLocation]
    
    enum CodingKeys: String, CodingKey {
        case payeeLocations = "payee_locations"
    }
}

public struct BKPayeeLocation: Decodable {
    public var id: UUID
    public var payeeID: UUID
    // TODO: Convert lat and lon to degrees???
    public var latitude: String?
    public var longitude: String?
    public var isDeleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case payeeID = "payee_id"
        case latitude = "latitude"
        case longitude = "longitude"
        case isDeleted = "deleted"
    }
}
