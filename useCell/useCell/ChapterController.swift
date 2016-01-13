//
//  ChapterController.swift
//  useCell
//
//  Created by cami on 1/6/16.
//  Copyright © 2016 Bariatric Surgery Source. All rights reserved.
//

import UIKit

class ChapterController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var chapterView: UITableView!
    
   
    let buttonCellIdentifier = "ButtonCell"
    
    let chapterSegueIdentifier = "ShowChapterSegue"
    
    let chapter = ["Chapter 1", "Chapter 2", "Chapter 3","Chapter 4"]
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == chapterSegueIdentifier {
            if let destination = segue.destinationViewController as? PageNextBackController {
                if let ebookIndex = chapterView.indexPathForSelectedRow?.row {
                        destination.chapterName = chapter[ebookIndex]
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapterView.delegate = self
        chapterView.dataSource = self

    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title  = "Ebook"
    
    }
    

    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return chapter.count
 
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(buttonCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        
    
        cell.textLabel?.text = chapter[row]

        
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
            print(chapter[row])
    }

    


}
