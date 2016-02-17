//
//  ViewController.swift
//  RefreshControllForTableView
//
//  Created by ligulfzhou on 2/17/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let identifier:String = "identifier"
    var tableview: UITableView!
    var items: [String] = ["hello", "ligulf", "zhou"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: "handleRefresh:", forControlEvents: .ValueChanged)
        
        tableview = UITableView(frame: view.frame, style: .Plain)
        tableview.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        tableview.dataSource = self
        tableview.addSubview(refreshControll)
        view.addSubview(tableview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier)
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
    
    func handleRefresh(paramSender: AnyObject){
        items.append("!!!")
        items.append("welcome")
        items.append("back")
        
        tableview.reloadData()
        paramSender.endRefreshing()
    }
}

