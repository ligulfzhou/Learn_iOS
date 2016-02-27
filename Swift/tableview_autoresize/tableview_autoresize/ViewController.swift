//
//  ViewController.swift
//  tableview_autoresize
//
//  Created by ligulfzhou on 2/26/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableViewCellIdentifier:String = "identifier"
    var tableView:UITableView?
    var rows:[String] = ["t_doc = dictcon=orderno, uid=self.userid, combo_id=None, combo_idx=None, coupon_id=0, status=0,exprnum=None, order_items=items_list, chgtime={0 ts}, created=ts, modified=ts)", "DATABASEyoucaiPRI_KEY = rsa.PrivateKeyload_pkcs1(b);", "safdljdslafkjds;lfkja;lsdkfjal;skdjflaksdjf;lkdsjaflkjdalkdfjaldkjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "lkdsjaflkjd alkdfj aldkjfkk kkkkkkk kkkkkkk kkkkkkkkkkk kkkkkkkkkkkkkkk kkkkkkkkkk kkkk lkdsjaflkj  dalkdfj aldkjfkkkk kkkkkkkk kkkkkkkkkk kkkkkkk kkkkkkkkk kkkkkkkkk kkkkkkkkk lkdsjaflk jdalkdfja ldkjfkkkk kkkkkkkkk kkkkkkkkk kkkkkkkkk kkkkkkkkk kkkkkkkkk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: tableViewCellIdentifier)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        
        tableView?.estimatedRowHeight = 68.0
        tableView?.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: tableview dataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //MARK: tableview delegate
//    func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier, forIndexPath: indexPath)
        if indexPath.row % 2 == 0{
            cell.imageView?.image = UIImage(named: "Hello")
            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        }
        cell.textLabel?.lineBreakMode = .ByWordWrapping
        cell.textLabel?.text = rows[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

