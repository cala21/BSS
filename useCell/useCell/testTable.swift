//
//  testTable.swift
//  useCell
//
//  Created by cami on 1/11/16.
//  Copyright © 2016 Bariatric Surgery Source. All rights reserved.
//

import UIKit

class testTable: UITableViewController {

    let textCellIdentifier = "NewTextCell"
    
    let ebookSegueIndentifier = "ShowChapterControllerSegue"
    
    let drSegueIdentifier = "ShowDrSegue"   //New
    
    let content = ["EBook", "X", "Y"]
    
    let about = ["Dr. X", "BSS"]
    
    //New
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        /*if segue.identifier == drSegueIdentifier {
            if let destination = segue.destinationViewController as? BlogViewController {
                
                print(tableView.indexPathForSelectedRow?.row)
                if let blogIndex = tableView.indexPathForSelectedRow?.row {
                    print("in dest")
                    if tableView.indexPathForSelectedRow?.section == 0 {
                        destination.blogName = content[blogIndex]
                        
                    }
                        
                    else {
                        destination.blogName = about[blogIndex]
                    }
                }
            }
        }
        
        if segue.identifier == drSegueIdentifier {
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
        }*/
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK:  UITextFieldDelegate Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return content.count
        }
        else {
            return about.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            
            return "Content"
        }
        else{
            
            return "About"
        }
    }
    
    // MARK:  UITableViewDelegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        if indexPath.section == 0 {
            print(content[row])
            if row == 0 {

                self.performSegueWithIdentifier(ebookSegueIndentifier, sender: self)
                print("This is index:\(indexPath.row)")
            }
            
            if row == 1 {
                self.performSegueWithIdentifier(drSegueIdentifier, sender: self)
                print("This is index:\(indexPath.row)")
            }
        }
        

        else {
             print(about[row])
        }
      
    }

}
