//
//  OffersPageViewController.swift
//  BookMart
//
//  Created by Brian Wang on 4/22/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

class OffersPageViewController: UIPageViewController {
    
    private (set) lazy var orderedViewControllers: [UIViewController] = {
        
        return [self.newColoredViewController("Profile"),
                self.newColoredViewController("Offers"),
                self.newColoredViewController("Camera")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController {
        if(color == "Profile"){
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileViewController")
        }else{
            return UIStoryboard(name: color, bundle: nil).instantiateViewControllerWithIdentifier("\(color)ViewController")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([orderedViewControllers[1]], direction: .Forward, animated: true, completion: nil)
        }
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

extension OffersPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else{
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else{
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else{
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else{
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else{
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}