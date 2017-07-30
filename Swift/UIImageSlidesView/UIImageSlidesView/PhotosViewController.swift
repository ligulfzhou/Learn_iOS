//
//  PhotosViewController.swift
//  UIImageSlidesView
//
//  Created by ligulfzhou on 2/18/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    var imageNames: [String]!
    var imageView: UIImageView!
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: imageNames[0])
        imageView.sizeToFit()
        view.addSubview(imageView)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "panGesture:"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func panGesture(sender: UIPanGestureRecognizer){
        if currentIndex < imageNames.count - 1{
            currentIndex += 1
            imageView.removeFromSuperview()
            imageView = UIImageView(frame: view.bounds)
            imageView.image = UIImage(named: imageNames[currentIndex])
            imageView.sizeToFit()
            view.addSubview(imageView)
        }
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
