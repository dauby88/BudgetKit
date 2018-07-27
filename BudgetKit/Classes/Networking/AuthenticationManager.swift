//
//  AuthenticationManager.swift
//  TQL Carrier Dashboard
//
//  Created by TQL Mobile on 2/5/18.
//  Copyright © 2018 Total Quality Logistics. All rights reserved.
//

import UIKit
import SafariServices

public class AuthenticationManager {
    
    private init() {}
    static let shared = AuthenticationManager()
    
    // MARK: Properties
    
    var authSession: SFAuthenticationSession?
    
    var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: "YNABAccessToken")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "YNABAccessToken")
            WebServiceManager.shared.resetSession()
        }
    }
    
    var isAuthenticated: Bool {
        return accessToken != nil
    }
    
    var accessTokenExpiration: Date? {
        get {
            return UserDefaults.standard.object(forKey: "YNABAccessTokenExpiration") as? Date
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "YNABAccessTokenExpiration")
        }
    }
    
    // MARK: - Login
    
    func login(personalAccessToken: String) {
        accessToken = personalAccessToken
    }
    
    func login(clientID: String, redirectURI: String, state: String?, authenticated: @escaping (() -> Void), failed: @escaping ((Error) -> Void)) {
        
        var urlString = "https://app.youneedabudget.com/oauth/authorize?client_id=\(clientID)&redirect_uri=\(redirectURI)&response_type=token"
        if let state = state {
            urlString += "&state=\(state)"
        }
        let url = URL(string: urlString)!
        let callBackScheme = URL(string: redirectURI)?.scheme
        
        authSession = SFAuthenticationSession(url: url, callbackURLScheme: callBackScheme) { (url, error) in
            if let authError = error {
                // Handle error
                failed(authError)
                return
            }
            
            if var newAccessToken = url?.fragment {
                let firstCount = "access_token=".count
                // TODO: This needs to be more precise. It's too dependent on expiration time.
                let lastCount = "&token_type=bearer&expires_in=6881".count
                newAccessToken = String(newAccessToken.dropFirst(firstCount))
                newAccessToken = String(newAccessToken.dropLast(lastCount))
                self.accessToken = newAccessToken
                // TODO: Get expiration date
                let secondsDropCount = firstCount + newAccessToken.count + lastCount - 4
                if let subsequence = url?.fragment?.dropFirst(secondsDropCount), let seconds = Double(String(subsequence)) {
                    self.accessTokenExpiration = Date(timeIntervalSinceNow: seconds)
                }
                authenticated()
            }
        }
        authSession?.start()
    }
    
    // MARK: - Logout
    
    func logout() {
        clearAuthentication()
    }
    
    func clearAuthentication() {
        accessToken = nil
    }
}
