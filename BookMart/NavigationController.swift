//
//  NavigationController.swift
//  BookMart
//
//  Created by Nav Saini on 3/23/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.translucent = true
        self.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationBar.barStyle = .Black
        self.navigationBar.titleTextAttributes = [
            NSFontAttributeName : UIFont(name: "Lato-Medium", size: 24)!,
            NSForegroundColorAttributeName : UIColor.whiteColor()
        ]
        // Do any additional setup after loading the view.
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
