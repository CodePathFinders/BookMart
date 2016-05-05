//
//  ProfileViewController.swift
//  BookMart
//
//  Created by Sita Mulomudi on 4/12/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    let firebase = Firebase(url: "https://glowing-fire-6824.firebaseio.com/")

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var usersRef: Firebase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usersRef = firebase.childByAppendingPath("users")
        let uid = NSUserDefaults.standardUserDefaults().objectForKey("uid") as? String
        usersRef!.observeEventType(.Value, withBlock: {snapshot in
            //self.nameLabel.text = snapshot.value[uid!]!!["name"] as? String
            //self.phoneLabel.text = snapshot.value[uid!]!!["phone"] as? String
            //self.emailLabel.text = snapshot.value[uid!]!!["email"] as? String
        }, withCancelBlock: { error in
            print(error.description)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
