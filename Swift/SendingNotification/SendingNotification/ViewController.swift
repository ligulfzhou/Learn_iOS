//
//  ViewController.swift
//  SendingNotification
//
//  Created by ligulfzhou on 2/21/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let notificationName: String = "NotificationName"
    override func viewDidLoad() {
        super.viewDidLoad()

        let notification = NSNotification(name: notificationName,
            object: self,
            userInfo: ["key1": "value1", "key2": "value1"])
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

