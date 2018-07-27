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
    
    fileprivate func performDataTask(_ request: URLRequest, success: @escaping ((_ data: Data) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        if let data = request.httpBody {
            printJSON(fromData: data)
        }
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let taskError = error {
                failure(taskError)
            } else if let response = response as? HTTPURLResponse,
                      let webServiceError = self.checkStatusCode(data, response: response) {
                failure(webServiceError)
            } else {
                self.printJSON(fromData: data!)
                success(data!)
            }
        }
    
        if self.networkConnectionAvailable() {
            task.resume()
        } else {
            failure(YNABAPIError.noNetworkConnection)
        }
    }
    
    func printJSON(fromData data: Data) {
        guard let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return }
        if let object = object as? JSONDictionary {
            guard let newData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else { return }
            guard let string = String(data: newData, encoding: .utf8) else { return }
            print(string)
        } else if let object = object as? [JSONDictionary] {
            guard let newData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else { return }
            guard let string = String(data: newData, encoding: .utf8) else { return }
            print(string)
        }
    }
    
    func checkStatusCode(_ data: Data?, response: HTTPURLResponse!) -> Error? {
        // TODO: Update with expected YNAB responses
        var error: Error? = .none
        switch response.statusCode {
        case 200...299:
            break
        default:
            var errorMessage = "An error has occurred."
            do {
                let json_message = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: String]
                if let message = json_message?["Message"] {
                    errorMessage = message
                }
            } catch _ {}
            //error = TQLMobileAPIError.genericServerError(response.statusCode, errorMessage)
        }
        
        return error
    }
    
    func networkConnectionAvailable() -> Bool {
        // FIXME: Implement connection check???
        return true
//        guard let reachability = Reachability() else { return false }
//        switch reachability.connection {
//        case .wifi, .cellular:
//            return true
//        case  .none:
//            return false
//        }
    }
}
