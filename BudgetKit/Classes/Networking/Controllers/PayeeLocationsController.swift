//
//  PayeeLocationsController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/28/18.
//

import Foundation

class PayeeLocationsController: BaseController {

    static func getPayeeLocationList(budgetID: UUID?, completion: @escaping YNABCompletion<[PayeeLocation]>) {
        let path = initialPath(forBudget: budgetID) + "/payee_locations"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
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
    
    static func getPayeeLocation(budgetID: UUID?, payeeLocationID: UUID, completion: @escaping YNABCompletion<PayeeLocation>) {
        let path = initialPath(forBudget: budgetID) + "/payee_locations/" + payeeLocationID.uuidString
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
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
    
    static func getLocationListForPayee(budgetID: UUID?, payeeID: UUID, completion: @escaping YNABCompletion<[PayeeLocation]>) {
        let path = initialPath(forBudget: budgetID) + "/payees/" + payeeID.uuidString + "/payee_locations"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
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
