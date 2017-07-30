//
//  CollisionWithDelegateViewController.swift
//  DynamicAndIteractiveUserInterface
//
//  Created by ligulfzhou on 3/6/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class CollisionWithDelegateViewController: UIViewController, UICollisionBehaviorDelegate {

    var animator:UIDynamicAnimator!
    var squareView:UIView!
    let boundaryIdentifier = "boundaryIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        squareView.center = view.center
        squareView.backgroundColor = UIColor.blueColor()
        view.addSubview(squareView)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        let gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
        
        let collision =  UICollisionBehavior(items: [squareView])
//        collision.collisionMode = .Boundaries
        collision.collisionDelegate = self
        collision.addBoundaryWithIdentifier(boundaryIdentifier, fromPoint: CGPoint(x: 0, y: view.bounds.height), toPoint:CGPoint(x: view.bounds.width, y: view.bounds.height))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }

    //MARK: collision delegate
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        if identifier as? String == boundaryIdentifier{
            print("item撞上边界了， 可以做一下动画")
            UIView.animateWithDuration(1, animations: { () -> Void in
                let view = item as! UIView
                view.backgroundColor = UIColor.redColor()
                view.alpha = 0
                view.transform = CGAffineTransformMakeScale(2, 2)
                }, completion: {(finished Bool) -> Void in
                    let view = item as! UIView
                    view.removeFromSuperview()
            })
        }
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
