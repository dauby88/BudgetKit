//
//  ViewController.swift
//  BudgetKit
//
//  Created by Stuart Daubenmire on 07/24/2018.
//  Copyright (c) 2018 Stuart Daubenmire. All rights reserved.
//

import UIKit
import BudgetKit

class ViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel! {
        didSet {
            userLabel.text = ""
        }
    }
    
    // TODO: Remove personal token and client ID and replace with failing placeholder
    var personalToken = "3e8ac4e1502aa95e4c78724b841be79921a2f94c2c1746d6d169ff1eb5e0ac2a"
    var clientID = "f8c0b6a090eb98bd9f5f954d68bffa6dd4324c6e14c7fd5a7208cd8cc9ac655c"
    var redirectURI = "com.daubycafe.ynat://oauth2redirect/login"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func login(_ sender: Any) {
        
        let authenticated: () -> Void = {
            print("Authenticated!")
        }
        let failed: (Error) -> Void = { error in
            print("Failed!")
        }
        
        YNAB.login(clientID: clientID, redirectURI: redirectURI, state: nil, authenticated: authenticated, failed: failed)
        
        //YNAB.login(personalAccessToken: personalToken, shouldFail: false, authenticated: authenticated, failed: failed)
    }
    
    @IBAction func logout(_ sender: Any) {
        YNAB.logout()
    }
    
    @IBAction func getUser(_ sender: Any) {
        YNAB.getUser { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.userLabel.text = user.id.uuidString
                case .failure(let error):
                    self.userLabel.text = error.localizedDescription
                }
            }
        }
    }
}

