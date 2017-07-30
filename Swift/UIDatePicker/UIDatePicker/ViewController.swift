//
//  ViewController.swift
//  UIDatePicker
//
//  Created by ligulfzhou on 2/16/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker = UIDatePicker(frame: view.frame)
        datePicker.center = view.center
        datePicker.addTarget(self, action: "datePickerChange:", forControlEvents: .ValueChanged)
        
        // 限制时间间隔
        let oneYearTime:NSTimeInterval = 365 * 24 * 60 * 60
        let todayDate = NSDate()
        let oneYearFromToday = todayDate.dateByAddingTimeInterval(oneYearTime)
        let twoYearsFromToday = todayDate.dateByAddingTimeInterval(2 * oneYearTime)
        datePicker.minimumDate = oneYearFromToday
        datePicker.maximumDate = twoYearsFromToday
        
        // 时间格式
        datePicker.datePickerMode = .Date
        
        view.addSubview(datePicker)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: uidatepicker 的 target func
    func datePickerChange(sender: UIDatePicker){
        NSLog("\(sender.date)")
    }

}

