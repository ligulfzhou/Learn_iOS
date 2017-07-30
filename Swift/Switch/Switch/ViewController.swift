//
//  ViewController.swift
//  Switch
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var switcher:UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switcher = UISwitch(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        switcher.tintColor = UIColor.redColor()
        switcher.onTintColor = UIColor.brownColor()
        switcher.thumbTintColor = UIColor.blackColor()
        
        
        switcher.addTarget(self, action: "switcherClicked:", forControlEvents: .ValueChanged)
        view.addSubview(switcher)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: switcher click
    func switcherClicked(sender:UISwitch){
        print("the sender is \(sender)")
        
        if sender.on{
            NSLog("the switcher is onnnnnnnnnnnnnnnnnnnnnnnnnnnnnn")
        }else{
            NSLog("the swither is offffffffffffffffffffffffffffff")
        }
    }
}

