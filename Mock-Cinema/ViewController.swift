//
//  ViewController.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/2/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func btnLogout(_ sender: Any) {
        //user is not login
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
    }
    
    func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        self.performSegue(withIdentifier: "goLogin", sender: self)
    }
}

