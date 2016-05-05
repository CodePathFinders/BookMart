//
//  OffersViewController.swift
//  BookMart
//
//  Created by Sita Mulomudi on 3/10/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit
import Firebase

class OffersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet var tableView: UITableView!
    
    @IBAction func onAdd(sender: AnyObject) {
        ViewControllers.pageViewController.goToCamera()
    }
    
    var data = []
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("offerCell");
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBarHidden = false
        tableView.estimatedRowHeight = 114
        tableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
        
        let myRootRef = Firebase(url:"https://glowing-fire-6824.firebaseio.com/")
        let booksRef = myRootRef.childByAppendingPath("books")
        //booksRef.setValue(["booktest" : ["title" : "test"]])
        

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
