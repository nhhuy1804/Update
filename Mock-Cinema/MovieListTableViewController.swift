//
//  MovieListTableViewController.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/6/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit
import Firebase

class MovieListTableViewController: UITableViewController {
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnHello: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //user is not login
        if Auth.auth().currentUser?.uid == nil {
            btnHello.isHidden = true
            btnHello.isEnabled = false
            btnLogout.setTitle("Login", for: .normal)
            
        } else {
            btnHello.isHidden = false
            btnHello.isEnabled = true
            //btnLogout.setTitle("Logout", for: .normal)
            let uidd = Auth.auth().currentUser?.uid
            print(uidd)
        }
        
        
    }



    @IBAction func btnHello(_ sender: Any) {
        let srcUserInfo = self.storyboard?.instantiateViewController(withIdentifier: "userProfile") as! UserProfileViewController
        self.present(srcUserInfo, animated: true)

    }

    @IBAction func btnLogout(_ sender: Any) {
        //user is not login
        if Auth.auth().currentUser?.uid != nil {
            do {
                try Auth.auth().signOut()
            } catch let logoutError {
                print(logoutError)
            }
            
            btnHello.isHidden = true
            btnHello.isEnabled = false
            btnLogout.setTitle("Login", for: .normal)
        } else {
            //btnHello.isHidden = false
            //btnHello.isEnabled = true
            //btnLogout.setTitle("Logout", for: .normal)
            
            let srcLogin = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
            self.present(srcLogin, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
