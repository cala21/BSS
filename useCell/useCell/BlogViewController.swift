//
//  BlogViewController.swift
//  useCell
//
//  Created by cami on 12/29/15.
//  Copyright © 2015 Bariatric Surgery Source. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var blogNameLabel: UILabel!
 
    
    var blogName = String()
    
    override func viewWillAppear(animated: Bool) {
        print("This is blog Name: \(blogName)")
        blogNameLabel.text = "Other content"
        navigationItem.title = "X"
    }
    

}
