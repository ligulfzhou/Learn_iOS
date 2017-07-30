//
//  ViewController.swift
//  UIScrollView
//
//  Created by ligulfzhou on 2/19/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableview:UITableView!
    let identifier:String = "TableCellIdentifier"
    let tableRows = ["image Scrolll", "custom view scroll", "paged", "paged with peeking"]
    let viewControllers = [ImageScrollViewController.classForCoder()]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "scroll view"
        
        tableview = UITableView(frame: view.bounds)
        tableview.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        tableview.dataSource = self
        tableview.delegate = self
        view.addSubview(tableview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: uitableview data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell.textLabel?.text = tableRows[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let viewController = viewControllers[indexPath.row]() as UIViewController
        
        let viewController = ImageScrollViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

