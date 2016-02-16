//
//  ViewController.swift
//  UISegmentViewAddToNavigationBar
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segments: UISegmentedControl!
    var items:[String] = ["hello", "ligulf", "zhou"]
    override func viewDidLoad() {
        super.viewDidLoad()

        segments = UISegmentedControl(items: items)
        navigationItem.titleView = segments
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

