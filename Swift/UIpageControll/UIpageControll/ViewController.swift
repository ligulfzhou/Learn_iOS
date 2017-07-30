//
//  ViewController.swift
//  UIpageControll
//
//  Created by ligulfzhou on 3/4/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pageController:UIPageControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = UIPageControl(frame: view.bounds)
        pageController?.currentPage = 0
        pageController?.numberOfPages = 10
        pageController?.currentPageIndicatorTintColor = UIColor.blackColor()
        pageController?.pageIndicatorTintColor = UIColor.redColor()
        view.addSubview(pageController!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

