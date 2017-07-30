//
//  MainViewController.swift
//  UITabWithTabstrip
//
//  Created by zhou ligang on 16/11/2016.
//  Copyright © 2016 zhouligang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITabBarControllerDelegate {

    var contentController:UITabBarController!
    var contentFrame:CGRect!
    
    let _titles: [String] = ["Tab1", "Tab2"]
    let _images: [String] = ["tab", "tab"]
    let _selectedImages: [String] = ["tab_selected", "tab_selected"]
    let _viewControllers = [Tab1ViewController(), Tab2ViewController()]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentController = UITabBarController()
        for (idx, vc) in _viewControllers.enumerated(){
            vc.tabBarItem.title = _titles[idx]
            vc.tabBarItem.image = UIImage(named: _images[idx])
            vc.tabBarItem.selectedImage = UIImage(named: _selectedImages[idx])
            let naviVC = UINavigationController(rootViewController: vc)
            contentController.addChildViewController(naviVC)
        }
        contentController.delegate = self
        contentFrame = self.view.bounds
        self.view.addSubview(contentController.view)
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
