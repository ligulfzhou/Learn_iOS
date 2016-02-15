//
//  PopupViewController.swift
//  PopupModalWithTableView
//
//  Created by ligulfzhou on 2/15/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class PopupViewController: UITableViewController {
    
    struct TableViewValues{
        static let identifier = "Cell"
    }
    
    lazy var items:[String] = {
        var returnItems:[String] = []
        for i in 1...10{
            returnItems.append("item \(i)")
        }
        
        return returnItems
    }()

//    var cancleBarButtonItem = UIBarButtonItem()
    var selectionHandler:((selectedItem: String) -> Void!)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cancleBarButtonItem = UIBarButtonItem(title: "cancel", style: .Plain, target: self, action: "performCancel")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: TableViewValues.identifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        preferredContentSize = CGSize(width: 100, height: 200)
        modalPresentationStyle = .Popover
    }
    
    func performCancel(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: protocol: tableview datasource and delegate
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewValues.identifier, forIndexPath: indexPath) as UITableViewCell
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
