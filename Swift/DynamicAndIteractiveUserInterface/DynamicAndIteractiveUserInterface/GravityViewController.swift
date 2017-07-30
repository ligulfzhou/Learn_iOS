//
//  GravityViewController.swift
//  DynamicAndIteractiveUserInterface
//
//  Created by ligulfzhou on 3/6/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {

    var squareView:UIView!
    var animator:UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        squareView.center = view.center
        squareView.backgroundColor = UIColor.redColor()
        view.addSubview(squareView)
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
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
