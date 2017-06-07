//
//  LoginViewController.swift
//  Mock-Cinema
//
//  Created by Cntt35 on 6/3/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        if (txtEmail.text?.isEmpty)! || (txtPassword.text?.isEmpty)! {
            self.displayMyAlertMessage(userMessage: "Please fill out all required fields")
        } else {
            
            if let email = txtEmail.text, let password = txtPassword.text {
                
                //Log in the user with Firebase
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    
                    //Error -> show message
                    if error != nil {
                        self.displayMyAlertMessage(userMessage: "Wrong email or password")
                        self.txtEmail.text?.removeAll()
                        self.txtPassword.text?.removeAll()
                        
                    } else {
                        let srcMain = self.storyboard?.instantiateViewController(withIdentifier: "home") as! MovieListViewController
                        self.present(srcMain, animated: true)
                    }
                })
            }
        }
        
    }
    
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
