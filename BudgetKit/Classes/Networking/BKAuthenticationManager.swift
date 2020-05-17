//
//  AuthenticationManager.swift
//  TQL Carrier Dashboard
//
//  Created by TQL Mobile on 2/5/18.
//  Copyright © 2018 Total Quality Logistics. All rights reserved.
//

import UIKit
import SafariServices

public class BKAuthenticationManager {
    
    private init() {}
    static let shared = BKAuthenticationManager()
    
    
    /// As specified by YNAB, not sending a "scope" parameter will result in a read & write access token being created, this struct is created for more generic implmentation in the future rather than a "Bool" read only param in the login method https://api.youneedabudget.com/#oauth-authorization-parameters
    public enum PermissionScope: String {
        // The possible values for the scope permission
        case readOnly = "read-only"
        case readAndWrite = ""
    }
    
    // MARK: Properties
    
    var authSession: SFAuthenticationSession?
    
    var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: "YNABAccessToken")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "YNABAccessToken")
            BKWebServiceManager.shared.resetSession()
        }
    }
    
    var isAuthenticated: Bool {
        let tokenIsExpired = accessTokenExpiration ?? Date().addingTimeInterval(-10) < Date()
        let tokenIsNil = accessToken == nil
        return tokenIsExpired || tokenIsNil ? false : true
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
    
    func login(clientID: String,
               redirectURI: String,
               state: String?,
               permissions: PermissionScope,
               authenticated: @escaping (() -> Void),
               failed: @escaping ((Error) -> Void)) {
        
        var urlString = "https://app.youneedabudget.com/oauth/authorize?client_id=\(clientID)&redirect_uri=\(redirectURI)&response_type=token"
        if let state = state {
            urlString += "&state=\(state)"
        }
        
        if permissions.rawValue.count > 0 {
            urlString += "&scope=\(permissions.rawValue)"
        }
        
        let url = URL(string: urlString)!
        let callBackScheme = URL(string: redirectURI)?.scheme
        
        authSession = SFAuthenticationSession(url: url, callbackURLScheme: callBackScheme) { (url, error) in
            if let authError = error {
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
                let secondsDropCount = firstCount + newAccessToken.count + lastCount - 4
                if let subsequence = url?.fragment?.dropFirst(secondsDropCount), let seconds = Double(String(subsequence)) {
                    self.accessTokenExpiration = Date(timeIntervalSinceNow: seconds)
                    print("Token expiration: \(self.accessTokenExpiration!)")
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
        accessTokenExpiration = nil
    }
}
