//
//  UserController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/24/18.
//

import Foundation

struct UserController {
    
    static var baseURL: String {
        return API.baseURL + "user/"
    }
        
    static func getUser(completion: @escaping ((Result<User>) -> Void)) {
        
        let url = URL(string: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(UserResponse.self, from: data)
                let user = response.userWrapper.user
                completion(.success(user))
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
