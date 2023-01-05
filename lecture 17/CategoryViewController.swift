//
//  CategoryViewController.swift
//  lecture 17
//
//  Created by omari katamadze on 05.01.23.
//

import UIKit

class CategoryViewController: UIPageViewController  {
    
    
    
    
    
    var individualPageViewControllerList = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        individualPageViewControllerList=[
            CategoryDetailsViewController.getInstance(index: 0),       CategoryDetailsViewController.getInstance(index: 1),
            CategoryDetailsViewController.getInstance(index: 2),
            CategoryDetailsViewController.getInstance(index: 3),
            CategoryDetailsViewController.getInstance(index: 4),
        ]
        setViewControllers([individualPageViewControllerList[0]], direction:.forward, animated: true, completion: nil)
    }
}
extension CategoryViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageViewController = individualPageViewControllerList.firstIndex(of:  viewController)!
        
        if indexOfCurrentPageViewController == 0 {
            return nil
        }else{
            return individualPageViewControllerList[indexOfCurrentPageViewController - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentindexOdPageViewController = individualPageViewControllerList.firstIndex(of:  viewController)!
        
        if currentindexOdPageViewController == individualPageViewControllerList.count - 1 {
            return nil
        }else{
            return individualPageViewControllerList[currentindexOdPageViewController + 1]
        }
      
    }
    
    
    }

extension CategoryViewController : UIPageViewControllerDelegate{
    
}
