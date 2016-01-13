//
//  ViewController.swift
//  useCell
//
//  Created by cami on 12/29/15.
//  Copyright © 2015 Bariatric Surgery Source. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    let textCellIdentifier = "TextCell"
    
    let blogSegueIdentifier = "ShowBlogSegue"   //New
    
    let content = ["EBook", "X", "Y"]
    
    let about = ["Dr. X", "BSS"]
    
    //New
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == blogSegueIdentifier {
            if let destination = segue.destinationViewController as? BlogViewController {
                if let blogIndex = tableView.indexPathForSelectedRow?.row {
                    if tableView.indexPathForSelectedRow?.section == 0 {
                            destination.blogName = content[blogIndex]
                    }
                        
                    else {
                            destination.blogName = about[blogIndex]
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return content.count
        }
        else {
            return about.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        
        if indexPath.section == 0 {
            cell.textLabel?.text = content[row]
        }
        
        else {
            cell.textLabel?.text = about[row]
        }
        
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    
    // MARK:  UILabelFieldDelegate Methods
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            
            return "Content"
        }
        else{
            
            return "About"
        }
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        if indexPath.section == 0 {
             print(content[row])
        }
            
        else {
             print(about[row])
        }
       
    }
    
    
    
    

}

