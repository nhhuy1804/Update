//
//  UserProfileViewController.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/6/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class UserProfileViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUID: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserProfile()
        disableTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Logout current account
    @IBAction func btnLogout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let src = self.storyboard?.instantiateViewController(withIdentifier: "home") as! MovieListViewController
        self.present(src, animated: true)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnChangePassword(_ sender: Any) {
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        txtName.isEnabled = true
        txtPhone.isEnabled = true
        btnOK.isEnabled = true
        txtName.backgroundColor = UIColor.white
        txtPhone.backgroundColor = UIColor.white
        btnOK.backgroundColor = btnEdit.backgroundColor
    }
    
    @IBAction func btnOK(_ sender: Any) {
        if (txtName.text == "" || txtPhone.text == "") {
            displayMyAlertMessage(userMessage: "Please fill out all required fields")
        }
        else {
            // Write edits to Firebase database
            let ref = Database.database().reference()
            let usrid = Auth.auth().currentUser?.uid
            let post : [String: AnyObject] = ["name": txtName.text as AnyObject, "email": txtEmail.text as AnyObject, "phone": txtPhone.text as AnyObject]
            ref.child("users").child(usrid!).setValue(post)
            displayMyAlertMessage(userMessage: "Update successful")
        }
        txtName.isEnabled = false
        txtPhone.isEnabled = false
        txtName.backgroundColor = txtEmail.backgroundColor
        txtPhone.backgroundColor = txtEmail.backgroundColor
        btnOK.isEnabled = false
        btnOK.backgroundColor = UIColor.brown
        getUserProfile()
    }
    
    func disableTextField() {
        txtName.isEnabled = false
        txtPhone.isEnabled = false
        txtUID.isEnabled = false
        txtEmail.isEnabled = false
        btnOK.isEnabled = false
        btnOK.backgroundColor = UIColor.brown
    }
    
    // Get user info
    func getUserProfile() {
        let ref = Database.database().reference()
        let usrid = Auth.auth().currentUser?.uid
        ref.child("users").child(usrid!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String
            let email = value?["email"] as? String
            let phone = value?["phone"] as? String
            self.txtName.text = name
            self.txtEmail.text = email
            self.txtUID.text = usrid
            self.txtPhone.text = phone
        }) { (error) in
            self.displayMyAlertMessage(userMessage: "Error")
        }
    }
    
    // Function Alert message
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
