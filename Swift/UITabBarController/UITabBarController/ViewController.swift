//
//  ViewController.swift
//  UITabBarController
//
//  Created by ligulfzhou on 2/18/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewControllerOne = ViewControllerOne()
        let viewControllerTwo = ViewControllerTwo()
    
        viewControllerOne.tabBarItem.title = "one"
        viewControllerTwo.tabBarItem.title = "two"
        self.viewControllers = [viewControllerOne, viewControllerTwo]
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        return true
    }
}

