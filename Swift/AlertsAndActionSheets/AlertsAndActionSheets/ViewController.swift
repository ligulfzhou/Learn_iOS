//
//  ViewController.swift
//  AlertsAndActionSheets
//
//  Created by ligulfzhou on 2/15/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableview:UITableView?
    let tableRows:[String] = ["simple alert view", "alert view with text field", "action sheet with destructive button"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview = UITableView(frame: view.bounds, style: .Plain)
        tableview!.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        tableview!.dataSource = self
        tableview!.delegate = self
        view.addSubview(tableview!);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: uitableview datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableRows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier:String = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = tableRows[indexPath.row];
        return cell
    }

    //MARK: uitableview delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 0: simple_alert_view()
        case 1: alert_view_with_textfield()
        case 2: action_sheet_with_destructive_button()
        default:
            break
        }
    }
    
    //MARK: different alerts and action sheets
    func simple_alert_view(){
        let controller = UIAlertController(title: "title", message: "this is message", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Done", style: .Default, handler: {(paramAction: UIAlertAction) in print("ddddddd")})
        controller.addAction(action)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func alert_view_with_textfield(){
        let controller = UIAlertController(title: "title", message: "this is message", preferredStyle: .Alert)
        controller.addTextFieldWithConfigurationHandler(
            {(textField:UITextField) in
                textField.placeholder = "XXXXXX"
        })
        
        let action = UIAlertAction(title: "Next", style: .Default, handler: {(paramAction: UIAlertAction) in
            if let textFields = controller.textFields{
                let theTextFields = textFields as [UITextField]
                let userName = theTextFields[0].text
                print("your username is \(userName)")
            }
        })
        controller.addAction(action)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func action_sheet_with_destructive_button(){
        let controller = UIAlertController(title: "title", message: "this is message", preferredStyle: .ActionSheet)
        let action1 = UIAlertAction(title: "action1", style: .Default) { (paramAction:UIAlertAction) -> Void in
            print("action 1: selected")
        }
        let action2 = UIAlertAction(title: "action2", style: .Default) { (paramAction:UIAlertAction) -> Void in
            print("action 2: selected")
        }
        let action3 = UIAlertAction(title: "action3", style: .Default) { (paramAction:UIAlertAction) -> Void in
            print("action 3: selected")
        }
        
        controller.addAction(action1)
        controller.addAction(action2)
        controller.addAction(action3)
        presentViewController(controller, animated: true, completion: nil)
    }
}

