//
//  PushBehaviourViewController.swift
//  DynamicAndIteractiveUserInterface
//
//  Created by ligulfzhou on 3/6/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class PushBehaviourViewController: UIViewController {

    var animator:UIDynamicAnimator!
    var squareView:UIView!
    var pushBehaviour:UIPushBehavior!
    override func viewDidLoad() {
        super.viewDidLoad()

        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        squareView.backgroundColor = UIColor.redColor()
        squareView.center = view.center
        view.addSubview(squareView)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        pushBehaviour = UIPushBehavior(items: [squareView], mode: UIPushBehaviorMode.Instantaneous)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(pushBehaviour)
        animator.addBehavior(collision)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTap:"))
    }

    func handleTap(tap:UITapGestureRecognizer){
        /* Get the angle between the center of the square view
        and the tap point */
        let tapPoint = tap.locationInView(view)
        let squareViewCenterPoint = squareView.center
        /* Calculate the angle between the center point of the square view and
        the tap point to find out the angle of the push
        Formula for detecting the angle between two points is:
        arc tangent 2((p1.x - p2.x), (p1.y - p2.y)) */
        let deltaX = tapPoint.x - squareViewCenterPoint.x
        let deltaY = tapPoint.y - squareViewCenterPoint.y
        let angle = atan2(deltaY, deltaX)
        pushBehaviour!.angle = angle
        /* Use the distance between the tap point and the center of our square
        view to calculate the magnitude of the push
        Distance formula is:
        square root of ((p1.x - p2.x)^2 + (p1.y - p2.y)^2) */
        let distanceBetweenPoints = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehaviour!.magnitude = distanceBetweenPoints / 200.0
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
