//
//  ViewController.swift
//  rw1_storyboard
//
//  Created by zhou ligang on 30/07/2017.
//  Copyright © 2017 zhouligang. All rights reserved.
//


//https://www.raywenderlich.com/113388/storyboards-tutorial-in-ios-9-part-1

//Note: You probably won’t be using the First Responder very much. This is a proxy object that refers to whatever object has first responder status at any given time. As an example, you can hook up the Touch Up Inside event from a button to First Responder’s cut: selector. If at some point a text field has input focus then you can press that button to make the text field, which is now the first responder, cut its text to the pasteboard.


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

