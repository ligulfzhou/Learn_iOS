//
//  ViewController.swift
//  TableView
//
//  Created by ligulfzhou on 2/17/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableview:UITableView!
    var data = [["sec0-row0", "sec0-row1"], ["sec1-row0", "sec1-row1", "sec1-row2"], ["sec2-row0", "sec2-row1", "sec2-row2", "sec2-row3"]]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "table view"
        
        tableview = UITableView(frame: view.bounds, style: .Grouped)
        tableview.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier")
        tableview.dataSource = self
        tableview.delegate = self
        tableview.center = view.center
        
        view.addSubview(tableview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: tableview datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("identifier", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    //MARK: tableview delegate
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 0 && indexPath.row == 0{
            return false
        }
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //***** 需要先将数据删掉 ******
        data[indexPath.section].removeAtIndex(indexPath.row)
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "section \(section) Header"
        label.sizeToFit()
        label.backgroundColor = UIColor.redColor()
        return label
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "section \(section) Footer"
        label.sizeToFit()
        label.backgroundColor = UIColor.yellowColor()
        label.frame.origin.x += 20
        label.frame.origin.y = 5
        
        let resultFrame = CGRect(x: 0, y: 0, width: label.frame.size.width + 20, height: label.frame.size.height)
        let headerView = UIView(frame: resultFrame)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

