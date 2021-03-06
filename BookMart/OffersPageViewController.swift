//
//  OffersPageViewController.swift
//  BookMart
//
//  Created by Brian Wang on 4/22/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

struct ViewControllers {
    static var pageViewController: OffersPageViewController!
}

class OffersPageViewController: UIPageViewController {
    
    weak var pageDelegate: OffersPageViewControllerDelegate?
    
    private (set) lazy var orderedViewControllers: [UIViewController] = {
        
        return [self.newColoredViewController("Profile"),
                self.newColoredViewController("Offers"),
                self.newColoredViewController("Camera")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController {
        if(color == "Profile"){
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileViewController")
        } else if(color=="Offers") {
            return UIStoryboard(name: color, bundle: nil).instantiateViewControllerWithIdentifier("navController")
        } else {
            return UIStoryboard(name: color, bundle: nil).instantiateViewControllerWithIdentifier("\(color)ViewController")
        }
    }
    
    func goToCamera() {
        self.setViewControllers([orderedViewControllers[2]], direction: .Forward, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        ViewControllers.pageViewController = self
        
        pageDelegate?.offersPageViewController(self, didUpdatePageCount: orderedViewControllers.count)
        
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

extension OffersPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.indexOf(firstViewController) {
                pageDelegate?.offersPageViewController(self, didUpdatePageIndex: index)
        }
        
    }
}

protocol OffersPageViewControllerDelegate: class {
    
    func offersPageViewController(offersPageViewController: OffersPageViewController, didUpdatePageCount count: Int)
    
    func offersPageViewController(offersPageViewController: OffersPageViewController,
        didUpdatePageIndex count: Int)
}