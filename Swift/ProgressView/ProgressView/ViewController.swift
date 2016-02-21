//
//  ViewController.swift
//  ProgressView
//
//  Created by ligulfzhou on 2/21/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var progressView: UIProgressView?
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView = UIProgressView(progressViewStyle: .Default)
        progressView?.frame = view.bounds
        progressView?.center = view.center
        progressView?.progress = 0.5
        progressView?.trackTintColor = UIColor.lightGrayColor()
        progressView?.tintColor = UIColor.blueColor()
        view.addSubview(progressView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

