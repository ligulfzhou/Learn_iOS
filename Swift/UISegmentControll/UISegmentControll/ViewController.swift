//
//  ViewController.swift
//  UISegmentControll
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segments: UISegmentedControl!
    var items: [String] = ["hello", "ligulf", "zhou", "!!!"]
    
    //item 也可以为图片
//    var item = NSArray(objects: "hello", "ligulf", "zhou", UIImage(named: "imagename"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segments = UISegmentedControl(items: items)
//        segments.frame = CGRectMake(0, 0, 300, 50)
        segments.center = view.center
        segments.addTarget(self, action: "segmentSelect:", forControlEvents: .TouchDown)
//        segments.momentary = true
        view.addSubview(segments)
    }
    
    func segmentSelect(sender: UISegmentedControl){
        print("ddddddddddd")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

