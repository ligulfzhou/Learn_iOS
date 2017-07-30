//
//  JKRefreshControl.swift
//  pull_refresh
//
//  Created by zhou ligang on 21/10/2016.
//  Copyright © 2016 zhouligang. All rights reserved.
//

import UIKit

class JKRefreshControl: UIView {
    
    private let RefreshCongtrolWH = 45

    private var superView: UIScrollView!
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        //设置大小
        frame.size = CGSize(width: RefreshCongtrolWH, height: RefreshCongtrolWH)
        
        //添加红色以供测试
        backgroundColor = UIColor.red
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if let tmpSuperView = newSuperview as? UIScrollView{
            //报错  self.superview = superview
            self.superView = tmpSuperView
            superView.addObserver(self, forKeyPath: "frame", options: NSKeyValueObservingOptions.new, context: nil)
            superView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
            self.setLocation(superViewFrame: tmpSuperView.frame)
        }
    }
    
    private func setLocation(superViewFrame: CGRect){
        self.center = CGPoint(x: superViewFrame.width * 0.5, y: -20)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("\(keyPath), \(change)")
        if keyPath == "contentOffset"{
            print("\(self.superView.contentOffset.y), \(self.superView.contentInset)")
            self.center = CGPoint(x: self.superView.frame.width * 0.5, y: (self.superView.contentOffset.y) * 0.5)
        }else if keyPath == "frame"{
            let value = (change![NSKeyValueChangeKey.newKey] as! NSValue).cgRectValue
            self.setLocation(superViewFrame: value)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
