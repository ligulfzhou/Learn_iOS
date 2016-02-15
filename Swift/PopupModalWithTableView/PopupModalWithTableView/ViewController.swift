//
//  ViewController.swift
//  PopupModalWithTableView
//
//  Created by ligulfzhou on 2/15/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectItem:String?
    
//    lazy var popupContentController:UINavigationController = {
//        var controller = PopupViewController()
//        controller.selectionHandler = self.selectionHandler
//        var navi = UINavigationController(rootViewController: controller)
//        return navi
//    }()
    
//    lazy var popupController:UIPopoverController = {
//       return UIPopoverController(contentViewController: self.popupContentController)
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "dddddd"
        
        let button:UIButton = UIButton(type: .System)
        button.setTitle("title", forState: .Normal)
        button.frame.size = CGSize(width: 50, height: 50)
        button.center = view.center
        button.addTarget(self, action: "buttonClick:", forControlEvents: .TouchDown)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonClick(sender: UIButton){
//        NSLog("ddddddddddddddddddddddd")
        let popupview = PopupViewController(style: .Plain)
        presentViewController(popupview, animated: true, completion: nil)
        
        
        let popoverPresentationController = popupview.popoverPresentationController
        popoverPresentationController?.sourceView = sender

    }

    func selectionHandler(selectedItem:String){
        NSLog("\(selectItem)")
    }
    
}
