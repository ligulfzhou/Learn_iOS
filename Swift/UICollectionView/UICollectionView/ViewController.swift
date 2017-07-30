//
//  ViewController.swift
//  UICollectionView
//
//  Created by ligulfzhou on 2/17/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var collectionView:UICollectionView!
    var colors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: 80, height: 120)
        flowLayout.scrollDirection = .Vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "identifier")
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }

    //MARK: uicollectionview datasource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section + 2) * 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("identifier", forIndexPath: indexPath) as UICollectionViewCell
        cell.backgroundColor = colors[indexPath.section]
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: uicollectionview delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("\(indexPath.section) - \(indexPath.row)")
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("highlight: \(indexPath.section) - \(indexPath.row)")
    }
}

