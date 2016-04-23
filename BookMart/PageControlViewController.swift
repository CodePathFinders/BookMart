//
//  PageControlViewController.swift
//  BookMart
//
//  Created by Brian Wang on 4/22/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController {
    @IBOutlet weak var pageDots: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let offersPageViewController = segue.destinationViewController as? OffersPageViewController {
            offersPageViewController.pageDelegate = self
        }
    }

}

extension PageControlViewController: OffersPageViewControllerDelegate {
    
    func offersPageViewController(offersPageViewController: OffersPageViewController,
                                    didUpdatePageCount count: Int) {
        pageDots.numberOfPages = count
    }
    
    func offersPageViewController(tutorialPageViewController: OffersPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageDots.currentPage = index
    }
    
}