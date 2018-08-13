//
//  CategoriesController.swift
//  BudgetKit
//
//  Created by TQL Mobile on 7/27/18.
//

import Foundation

struct CategoriesController {
    
    static var baseURL: URL {
        let string = API.baseURL + "budgets/"
        return URL(string: string)!
    }
    
    static func getCategoryGroupList(budgetID: UUID, completion: @escaping YNABCompletion<[CategoryGroupWithCategories]>) {
        var path = budgetID.uuidString
        path += "/categories"
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                let categories = response.wrapper.categoryGroups
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }
        let failure: ((Error) -> Void) = { error in
            completion(.failure(error))
        }
        
        WebServiceManager.shared.get(url, success: success, failure: failure)
    }
    
    static func getCategoryList(budgetID: UUID, completion: @escaping YNABCompletion<[Category]>) {
        getCategoryGroupList(budgetID: budgetID) { (result) in
            switch result {
            case .success(let categoryGroups):
                var categories = [Category]()
                for group in categoryGroups {
                    categories += group.categories
                }
                completion(.success(categories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getCategory(budgetID: UUID, categoryID: UUID, completion: @escaping YNABCompletion<Category>) {
        var path = budgetID.uuidString
        path += "/categories/"
        path += categoryID.uuidString
        let url = URL(string: path, relativeTo: baseURL)!
        let success: ((Data) -> Void) = { data in
            do {
                let response = try JSONDecoder().decode(CategoryResponse.self, from: data)
                let category = response.wrapper.category
                completion(.success(category))
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
