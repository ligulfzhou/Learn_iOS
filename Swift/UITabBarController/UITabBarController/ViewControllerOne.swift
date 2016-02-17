//
//  ViewControllerOne.swift
//  UITabBarController
//
//  Created by ligulfzhou on 2/18/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: view.frame)
        label.text = "view controller 1"
        label.textColor = UIColor.blackColor()
        label.center = view.center
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
