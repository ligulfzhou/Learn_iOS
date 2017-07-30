//
//  ViewController.swift
//  FrameAndOrigin
//
//  Created by ligulfzhou on 2/23/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label:UILabel!
    var button:UIButton!
    var activityIndicator:UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activityIndicator.frame.origin = CGPoint(x: 400, y: 200)
        activityIndicator.frame.size = CGSize(width: 50, height: 50)
        view.addSubview(activityIndicator)
        
        label = UILabel()
        label.backgroundColor = UIColor.yellowColor()
        label.text = "dddd"
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 100, height: 100)
        view.addSubview(label)
        
        button = UIButton(type: .System)
        button.frame.origin = CGPoint(x:100, y:100)
        button.frame.size = CGSize(width: 100, height: 50)
        button.setTitle("Please Hit Me", forState: .Normal)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // buttonClicked, button target function
    func buttonClicked(sender: UIButton){
        if label.frame.origin.x == 0{
            label.alpha = 1
            label.frame.origin = CGPoint(x: 200, y: 200)
            //tintcolor ，是选中之后的颜色
            button.tintColor = UIColor.redColor()
            
            activityIndicator.startAnimating()
//            view.addSubview(activityIndicator)
            
        }else{
            label.alpha = 0.2
            label.frame.origin = CGPoint(x: 0, y: 0)
            label.tintColor = UIColor.blueColor()
//            activityIndicator.removeFromSuperview()
        }
    }
}

