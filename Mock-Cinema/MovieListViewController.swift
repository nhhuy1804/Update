//
//  MovieListViewController.swift
//  Mock-Cinema
//
//  Created by Cntt35 on 6/7/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit
import Firebase

class MovieListViewController: UIViewController {
    @IBOutlet weak var loginLogoutBtn: UIButton!
    @IBOutlet weak var helloBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //user is not login
        if Auth.auth().currentUser?.uid == nil {
            helloBtn.isHidden = true
            helloBtn.isEnabled = false
            loginLogoutBtn.setTitle("Login", for: .normal)
            
        } else {
            //user is login
            helloBtn.isHidden = false
            helloBtn.isEnabled = true
            loginLogoutBtn.setTitle("Logout", for: .normal)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoginLogout(_ sender: Any) {
        if Auth.auth().currentUser?.uid != nil {
            // //user is login
            do {
                try Auth.auth().signOut()
            } catch let logoutError {
                print(logoutError)
            }
            
            helloBtn.isHidden = true
            helloBtn.isEnabled = false
            loginLogoutBtn.setTitle("Login", for: .normal)
        } else {
            // //user is not login
            let srcLogin = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
            self.present(srcLogin, animated: true)
        }
    }

    @IBAction func btnHello(_ sender: Any) {
        let srcUserInfo = self.storyboard?.instantiateViewController(withIdentifier: "userProfile") as! UserProfileViewController
        self.present(srcUserInfo, animated: true)
    }
}
