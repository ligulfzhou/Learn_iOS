//
//  CollisionViewController.swift
//  DynamicAndIteractiveUserInterface
//
//  Created by ligulfzhou on 3/6/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class CollisionViewController: UIViewController {

    var squareViews = [AnyObject]()
    var animator:UIDynamicAnimator!
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgColors = [UIColor.redColor(), UIColor.blueColor()]
        animator = UIDynamicAnimator(referenceView: view)
        for idx in 0..<2{
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            newView.backgroundColor = bgColors[idx]
            newView.center = view.center
            squareViews.append(newView)
            view.addSubview(newView)
        }
        let gravity = UIGravityBehavior(items: squareViews as! [UIDynamicItem])
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: squareViews as! [UIDynamicItem])
//        collision.collisionMode = .Boundaries
//        collision.collisionMode = .Items
        collision.translatesReferenceBoundsIntoBoundary = true // superview的边界为collision边界
        animator.addBehavior(collision)
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
