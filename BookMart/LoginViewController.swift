//
//  ViewController.swift
//  BookMart
//
//  Created by Pranav Harathi, Nav Saini, Brian Wang on 3/10/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit
import Firebase
import AFNetworking

class ViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let firebase = Firebase(url: "https://glowing-fire-6824.firebaseio.com/")
    let verification = "http://apilayer.net/api/check?access_key=b563ec350246bc5e1688fc6ae41da82f&email="
    
    var usersRef: Firebase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usersRef = firebase.childByAppendingPath("users")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && usersRef?.authData != nil {
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onLogin(sender: AnyObject) {
        firebase.authUser(emailField.text, password: passwordField.text, withCompletionBlock: {error, authData in
            if error != nil {
                print("There was an error creating the account")
            } else {
                let uid = authData.uid
                print("Successfully logged in user with uid: \(uid)")
                NSUserDefaults.standardUserDefaults().setValue(uid, forKey: "uid")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        })
    }
   
    
    
    @IBAction func onForgot(sender: AnyObject) {
        if (emailField.text == "you@utexas.edu" || emailField.text ==  "") {
            print("Type in your username into the username field and press this button again")
        } else {
            firebase.resetPasswordForUser(emailField.text!, withCompletionBlock: { error in
                if error != nil {
                    print("There was an error processing this request")
                } else {
                    print("An email has been sent to you to reset your password")
                }
            })
        }
    }
    
    
}

