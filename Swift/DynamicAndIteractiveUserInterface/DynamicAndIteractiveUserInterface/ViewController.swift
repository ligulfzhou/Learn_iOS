//
//  ViewController.swift
//  DynamicAndIteractiveUserInterface
//
//  Created by ligulfzhou on 3/6/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableViewIdentifier = "tableview_identifer"
    var tableView:UITableView!
    var tableViewData:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "dynamic and iteractive"
        
        tableViewData = ["给UIView加重力", "碰撞检测", "碰撞检测（delegate）", "push behaviour", "attach multiple dynamic items to each other", "add a dynamic snap effect to your ui component", "assign characteristic to your dynamic effects"]
        
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: tableViewIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: tableview data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableViewIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = tableViewData[indexPath.row]
        return cell
    }
    
    //MARK: tableview delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 0:
//            presentViewController(GravityViewController(), animated: true, completion: nil)
            self.navigationController?.pushViewController(GravityViewController(), animated: false)
        case 1:
            self.navigationController?.pushViewController(CollisionViewController(), animated: false)
        case 2:
            self.navigationController?.pushViewController(CollisionWithDelegateViewController(), animated: false)
        case 3:
            self.navigationController?.pushViewController(PushBehaviourViewController(), animated: false)
        case 4:
            print("0")
        case 5:
            print("0")
        default:
            print("ddddd")
        }
    }
}

