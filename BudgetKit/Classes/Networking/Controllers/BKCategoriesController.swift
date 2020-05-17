//
//  CategoriesController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/27/18.
//

import Foundation

class BKCategoriesController: BKBaseController {
    
    static func getCategoryGroupList(budgetID: UUID?, completion: @escaping YNABCompletion<[BKCategoryGroupWithCategories]>) {
        let path = initialPath(forBudget: budgetID) + "/categories"
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKCategoriesResponse.self, from: data)
                let categories = response.wrapper.categoryGroups
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        BKWebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getCategoryList(budgetID: UUID?, completion: @escaping YNABCompletion<[BKCategory]>) {
        getCategoryGroupList(budgetID: budgetID) { (result) in
            switch result {
            case .success(let categoryGroups):
                var categories = [BKCategory]()
                for group in categoryGroups {
                    categories += group.categories
                }
                completion(.success(categories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getCategory(budgetID: UUID?, categoryID: UUID, completion: @escaping YNABCompletion<BKCategory>) {
        let path = initialPath(forBudget: budgetID) + "/categories/" + categoryID.uuidString
        let url = URL(string: path, relativeTo: baseURL(forBudget: budgetID))!
        
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(BKCategoryResponse.self, from: data)
                let category = response.wrapper.category
                completion(.success(category))
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
