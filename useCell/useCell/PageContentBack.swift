//
//  PageContentBack.swift
//  useCell
//
//  Created by cami on 1/10/16.
//  Copyright © 2016 Bariatric Surgery Source. All rights reserved.
//

import UIKit

class PageContentBack: UIViewController {

    
    @IBOutlet weak var contentTextBack: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        pageBackIndex++
        
        print("Back Page:\(currentIndex)")
        //Set page when slide right
        if currentIndex != 0 {
            contentTextBack.text = chapter1[currentIndex]
        }
            
        else {
            contentTextBack.text = "fuck"
        }
        
    }

    



    

   

}
