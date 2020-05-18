//
//  UserController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/24/18.
//

import Foundation

class UserController: BaseController {
    
    static func getUser(completion: @escaping YNABCompletion<User>) {
        
        let url = URL(string: userBaseUrl)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(UserResponse.self, from: data)
                let user = response.wrapper.user
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
