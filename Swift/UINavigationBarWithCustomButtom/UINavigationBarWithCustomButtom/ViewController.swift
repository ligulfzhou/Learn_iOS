//
//  ViewController.swift
//  UINavigationBarWithCustomButtom
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addSign = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addSignClicked:")
        navigationItem.rightBarButtonItem = addSign
        
        let button = UIButton(type: .System)
        button.setTitle("button", forState: .Normal)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = button
    }
    
    //MARK: addSignClicked and buttonClicked
    func addSignClicked(sender: UIBarButtonItem){
        NSLog("++++++++++++++++")
    }

    func buttonClicked(sender: UIButton){
        NSLog("buttonnnnnnnnnnnnnnn")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

