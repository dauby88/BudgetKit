//
//  PayeeLocationsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

struct PayeeLocationsController {
    
    static var baseURL: URL {
        let string = API.baseURL + "budgets/"
        return URL(string: string)!
    }
    
    static func getPayeeLocationList(budgetID: UUID, completion: @escaping YNABCompletion<[PayeeLocation]>) {
        var path = budgetID.uuidString
        path += "/payee_locations"
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(PayeeLocationListResponse.self, from: data)
                let locations = response.wrapper.payeeLocations
                completion(.success(locations))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getPayeeLocation(budgetID: UUID, payeeLocationID: UUID, completion: @escaping YNABCompletion<PayeeLocation>) {
        var path = budgetID.uuidString
        path += "/payee_locations/"
        path += payeeLocationID.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(PayeeLocationResponse.self, from: data)
                let location = response.wrapper.payeeLocation
                completion(.success(location))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getLocationListForPayee(budgetID: UUID, payeeID: UUID, completion: @escaping YNABCompletion<[PayeeLocation]>) {
        var path = budgetID.uuidString
        path += "/payees/"
        path += payeeID.uuidString
        path += "/payee_locations"
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(PayeeLocationListResponse.self, from: data)
                let locations = response.wrapper.payeeLocations
                completion(.success(locations))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
}
