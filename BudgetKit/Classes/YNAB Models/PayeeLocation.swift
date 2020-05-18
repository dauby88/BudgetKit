//
//  PayeeLocation.swift
//  YNABKit
//
//  Created by TQL Mobile on 7/18/18.
//  Copyright © 2018 Dauby Cafe. All rights reserved.
//

import Foundation

// Single Payee Location
struct PayeeLocationResponse: Decodable {
    var wrapper: PayeeLocationWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct PayeeLocationWrapper: Decodable {
    var payeeLocation: PayeeLocation
    
    enum CodingKeys: String, CodingKey {
        case payeeLocation = "payee_location"
    }
}

// Array of Payee Locations
struct PayeeLocationListResponse: Decodable {
    var wrapper: PayeeLocationListWrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct PayeeLocationListWrapper: Decodable {
    var payeeLocations: [PayeeLocation]
    
    enum CodingKeys: String, CodingKey {
        case payeeLocations = "payee_locations"
    }
}

public struct PayeeLocation: Decodable {
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
