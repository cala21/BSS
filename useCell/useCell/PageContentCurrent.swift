//
//  PageCintentViewController.swift
//  useCell
//
//  Created by cami on 1/6/16.
//  Copyright © 2016 Bariatric Surgery Source. All rights reserved.
//

import UIKit

class PageContentCurrent: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var contentText: UILabel!
 
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var pageCurrentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //if currentIndex == (pageCurrentIndex +1)
        
        
        //pageCurrentIndex = currentIndex
    }
    
    override func viewWillAppear(animated: Bool) {
        
        pageCurrentIndex++
        print("PageCurrentInd:\(pageCurrentIndex) and PageBackInd:\(pageBackIndex)")
        print("PageCurrentInd:\(pageCurrentIndex) and PageNextInd:\(pageNextIndex)")
        if currentIndex != 0 {
            if pageCurrentIndex == pageBackIndex{
                currentIndex++
            }
            
           /* if pageCurrentIndex == pageNextIndex {
                print("in check")
                currentIndex--
                if currentIndex == 0 {
                    print("zero")
                }
            }*/
        }
        print("Current Page:\(currentIndex)")
       // if currentIndex/pageCurrentIndex == 2 {
            contentText.text = chapter1[currentIndex]
            //print("This is current index in current Page: \(currentIndex), pageCurrentIndex: \(pageCurrentIndex)")
            pageCurrentIndex = 0
            pageBackIndex = 0
            pageNextIndex = 0
        //}
    
    }
    
    

    


}
