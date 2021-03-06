//
//  AddOfferViewController.swift
//  BookMart
//
//  Created by Sita Mulomudi on 5/5/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

class AddOfferViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookAuthors: UILabel!
    @IBOutlet var bookPrice: UILabel!
    @IBOutlet var numSellers: UILabel!
    
    var book: Book? {
        didSet {
            imageView.imageFromUrl((book?.imageURL)!)
            bookTitle.text = book?.title
            bookAuthors.text = book?.authors
        }
    }
    
    var offer: Offer! {
        didSet {
            bookPrice.text = "$\(offer.price)"
        }
    }
    
    @IBAction func onClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil) // how to dismiss modal view controllers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
