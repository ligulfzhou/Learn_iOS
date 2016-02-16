//
//  ViewController.swift
//  UIActivityViewControllerForShare
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var shareButton: UIButton!
    var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField = UITextField(frame: CGRect(x: 20, y: 35, width: 280, height: 30))
        textField.borderStyle = .RoundedRect
        textField.placeholder = "Enter text to share ..."
        textField.delegate = self
        view.addSubview(textField)
        
        shareButton = UIButton(type: .System)
        shareButton.frame = CGRect(x: 20, y: 80, width: 280, height: 40)
        shareButton.setTitle("Share", forState: .Normal)
        shareButton.addTarget(self,
            action: "handlerShare:",
            forControlEvents: .TouchUpInside)
        view.addSubview(shareButton)
    }

    //MARK: shareButton target function
    func handlerShare(sender: UIButton){
//        NSLog("\(sender.tag)")
        if (textField.text!.isEmpty){
            let message = "Please enter a text and then press shareButton"
            
            let alertController = UIAlertController(title: "title", message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        
        /* it is VERY important to cast your strings to NSString
        otherwise the controller cannot display the appropriate sharing options */
        let activityViewController = UIActivityViewController(activityItems: [textField.text!], applicationActivities: nil)
        
        presentViewController(activityViewController, animated: true, completion: nil)
        return
    }
    
    //MARK: textfield delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let activityViewController = UIActivityViewController(activityItems: [textField.text!], applicationActivities: nil)
        
        presentViewController(activityViewController, animated: true, completion: nil)
        return true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

