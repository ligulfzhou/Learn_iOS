//
//  ViewController.swift
//  UISlider
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider = UISlider(frame: view.frame)
        slider.center = view.center
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(self, action: "sliderTarget:", forControlEvents: .ValueChanged)
        
//      slider.setThumbImage(UIImage(named: "ThumbNormal"), forState: .Normal)
//      slider.setThumbImage(UIImage(named: "ThumbHighlighted"), forState: .Highlighted)
        
        view.addSubview(slider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: slider target func
    func sliderTarget(sender: UISlider){
        NSLog("\(sender.value)")
    }
}

