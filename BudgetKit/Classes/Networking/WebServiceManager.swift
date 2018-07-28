//
//  WebServiceManager.swift
//  TQL Carrier Dashboard
//
//  Created by Total Quality Logistics on 6/24/15.
//  Copyright (c) 2015 Total Quality Logistics. All rights reserved.
//

import UIKit
import SystemConfiguration

typealias JSONDictionary = [String: Any]

class WebServiceManager {
    
    static let shared = WebServiceManager()
    
    private init() {}
    
    // MARK: - URL Session
    
    lazy var session: URLSession = {
        return initializeSession()
    }()
    
    private func initializeSession() -> URLSession {
        let config = URLSessionConfiguration.default
        if let accessToken = AuthenticationManager.shared.accessToken {
            let authString = "Bearer \(accessToken)"
            config.httpAdditionalHeaders = ["Authorization": authString]
        }
        config.timeoutIntervalForRequest = 15
        return URLSession(configuration: config)
    }
    
    func resetSession() {
        session = initializeSession()
    }

    // MARK: - HTTP Methods
    
    func get(_ url: URL, success: @escaping ((_ data: Data) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        let request = URLRequest(url: url)
        performDataTask(request, success: success, failure: failure)
    }
    
    func post(_ url: URL, body: Data?, success: @escaping ((_ data: Data) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = body
        performDataTask(request, success: success, failure: failure)
    }
    
    func put(_ url: URL, body: Data?, success: @escaping ((_ data: Data) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = body
        performDataTask(request, success: success, failure: failure)
    }
    
    func delete(_ url: URL, success: @escaping ((_ data: Data) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        performDataTask(request, success: success, failure: failure)
    }
    
    fileprivate func performDataTask(_ request: URLRequest, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        
        _ = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let taskError = error {
                failure(taskError)
            } else if let data = data {
                if let wrapper = try? JSONDecoder().decode(YNABErrorWrapper.self, from: data) {
                    let ynabError = wrapper.error
                    failure(ynabError)
                } else {
                    success(data)
                }
            }
        }.resume()
    }
}
