//
//  PageContentNext.swift
//  useCell
//
//  Created by cami on 1/10/16.
//  Copyright © 2016 Bariatric Surgery Source. All rights reserved.
//

import UIKit

class PageContentNext: UIViewController {

    @IBOutlet weak var contentTextNext: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        print("Next Page:\(currentIndex)")
        pageNextIndex++
        //Set page when slide right    
        if currentIndex != 0 {
            contentTextNext.text = chapter1[currentIndex]
        }
            
        else {
            contentTextNext.text = "fuck"
        }
    }


}
