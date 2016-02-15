//
//  ViewController.swift
//  AttributedText
//
//  Created by ligulfzhou on 2/15/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label = UILabel(frame: CGRect(x: 20, y: 100, width: 500, height: 200))
        label.attributedText = self.attributedText()
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func attributedText() -> NSAttributedString{
        let string:NSString = "ligulf zhou"
        
        let result = NSMutableAttributedString(string: string as String)
        
        let attributeForFirstWord = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(50),
            NSForegroundColorAttributeName: UIColor.redColor(),
            NSBackgroundColorAttributeName: UIColor.blackColor()
        ]
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.yellowColor()
        shadow.shadowOffset = CGSize(width: 5, height: 5)
        let attributeForSecondWord = [
            NSFontAttributeName: UIFont.italicSystemFontOfSize(50),
            NSForegroundColorAttributeName: UIColor.blackColor(),
            NSBackgroundColorAttributeName: UIColor.redColor(),
            NSShadowAttributeName: shadow
        ]
        
        result.setAttributes(attributeForFirstWord, range: string.rangeOfString("ligulf"))
        result.setAttributes(attributeForSecondWord, range: string.rangeOfString("zhou"))
        
        return NSAttributedString(attributedString: result)
    }
}

