//
//  Person.swift
//  ListenAndReactNotification
//
//  Created by ligulfzhou on 2/21/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class Person: NSObject {

    var firstName:String?
    var lastName:String?
    
    func handleSetPersonInfoNotification(notification: NSNotification){
        firstName = notification.userInfo![AppDelegate.personInfoKeyFirstName()] as? String
        lastName = notification.userInfo![AppDelegate.personInfoKeyLastName()] as? String
    }

    override init(){
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleSetPersonInfoNotification:", name: AppDelegate.notificationName(), object: UIApplication.sharedApplication().delegate)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
