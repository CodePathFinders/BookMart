//
//  EditProfileViewController.swift
//  BookMart
//
//  Created by Nav Saini on 4/20/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit
import Firebase

class EditProfileViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    let firebase = Firebase(url: "https://glowing-fire-6824.firebaseio.com/")
    let verification = "http://apilayer.net/api/check?access_key=b563ec350246bc5e1688fc6ae41da82f&email="
    
     var usersRef: Firebase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usersRef = firebase.childByAppendingPath("users")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignup(sender: AnyObject) {
        let url: NSURL? =  NSURL(string: verification + emailField.text!)!
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSDictionary {
                if (responseDictionary["domain"] as? String != "utexas.edu") {
                    print("Please enter a valid UT email")
                }
                else if (Double(responseDictionary["score"] as! Double) < 0.8) {
                    print("Please enter a valid email")
                }
                else {
                    self.firebase.createUser(self.emailField.text, password: self.passwordField.text, withValueCompletionBlock: {error, result in
                        if error != nil {
                            print("There was an error creating the account")
                        } else {
                            let uid = result["uid"] as? String
                            print("Successfully created user account with uid: \(uid)")
                            let info = [
                                "name": self.nameField.text!,
                                "email": self.emailField.text!,
                                "phone": self.phoneField.text!
                            ]
                            self.usersRef?.childByAppendingPath(uid).setValue(info)
                        }
                    })
                }
            }
            
        })
        dataTask.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
