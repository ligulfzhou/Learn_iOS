//
//  ViewController.swift
//  UIImageSlidesView
//
//  Created by ligulfzhou on 2/18/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "title"
        tableview = UITableView(frame: view.bounds, style: .Plain)
        tableview.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier")
        tableview.center = view.center
        tableview.dataSource = self
        tableview.delegate = self
        
        view.addSubview(tableview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: uitableviewdatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("identifier")
        cell?.textLabel?.text = "查看图片"
        return cell
    }
    
    //MARK: uitableviewdelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let photoViewController = PhotosViewController()
        photoViewController.imageNames = ["B1", "B2", "B3"]
        self.navigationController?.pushViewController(photoViewController, animated: true)
    }
}

