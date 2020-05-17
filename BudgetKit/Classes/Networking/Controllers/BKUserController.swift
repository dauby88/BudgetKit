//
//  UserController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/24/18.
//

import Foundation

struct BKUserController {
    
    static var baseURL: String {
        return BKAPI.baseURL + "user/"
    }
        
    static func getUser(completion: @escaping YNABCompletion<BKUser>) {
        
        let url = URL(string: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKUserResponse.self, from: data)
                let user = response.wrapper.user
                completion(.success(user))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
}
