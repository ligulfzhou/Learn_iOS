//
//  ViewController.swift
//  pull_refresh
//
//  Created by zhou ligang on 21/10/2016.
//  Copyright © 2016 zhouligang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    lazy var refreshControl: JKRefreshControl = {
        let refresh = JKRefreshControl()
        return refresh
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "title"
        self.navigationController?.navigationBar.isTranslucent = false
        
        tableView = UITableView(frame: self.view.frame)
        tableView.addSubview(refreshControl)
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

