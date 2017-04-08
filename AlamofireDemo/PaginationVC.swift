//
//  PaginationVC.swift
//  AlamofireDemo
//
//  Created by Codiant Mac  on 4/4/17.
//  Copyright © 2017 Codiant Software Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class PaginationVC: UIViewController,UIPageViewControllerDataSource {

    var pageVC = UIPageViewController()
    var arrPhoto : NSArray = NSArray()
    var currentIndex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPhoto = ["2","3"];

        pageVC = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        pageVC.dataSource = self

        let pageContentVC: PageContentVC = viewControllerAtIndex(index: currentIndex)
        let viewControllers = [pageContentVC]
        
        pageVC.setViewControllers(viewControllers, direction: .forward, animated: false, completion: { _ in })
        pageVC.view.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(view.frame.size.width), height: CGFloat(view.frame.size.height - 60))

        addChildViewController(pageVC)
        view.addSubview(pageVC.view)
        pageVC.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentVC = viewController as! PageContentVC
        var index = pageContent.pageIndex

        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1;

        return viewControllerAtIndex(index: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: PageContentVC = viewController as! PageContentVC
        var index = pageContent.pageIndex

        if (index == NSNotFound)
        {
            return nil;
        }
        index += 1;

        if (index == arrPhoto.count)
        {
            return nil;
        }
        return viewControllerAtIndex(index: index)
    }
    
    func viewControllerAtIndex(index: NSInteger) -> PageContentVC
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentVC") as! PageContentVC
        pageContentViewController.strImg = "\(arrPhoto[index])"
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrPhoto.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
