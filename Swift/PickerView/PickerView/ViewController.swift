//
//  ViewController.swift
//  PickerView
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var picker:UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.center = view.center
        view.addSubview(picker)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    //MARK: uipickerview data source
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView ==  picker{
            return 10
        }
        return 0
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == picker{
            return 1
        }
        return 0
    }
    
    //MARK: uipickerivew delegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NSLog("\(row) -- \(component)")
    }
}

