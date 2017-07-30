//
//  ViewController.swift
//  GetStartWithiOS
//
//  Created by ligulfzhou on 2/12/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//    UINavigationControllerDelegate
//    UIImagePickerControllerDelegate

    var tmpString:String? = "ddddddd"
    
    //MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
//        photoImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "selectImageFromLibrary: "))
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: action
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromLibrary(sender: UITapGestureRecognizer) {
        mealNameLabel.text = "dddddddddddddddddddd"
    }
    
    func selectImageView(sender: UITapGestureRecognizer) {
        mealNameLabel.text = "select image"
        NSLog("dddddddd")
    }

    
    //MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
//        nameTextField.resignFirstResponder()
        mealNameLabel.text = textField.text
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        mealNameLabel.text = "begin editing"
        return true
    }
}

