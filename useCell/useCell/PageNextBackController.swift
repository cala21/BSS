//
//  PageNextBackController.swift
//  useCell
//
//  Created by cami on 1/7/16.
//  Copyright © 2016 Bariatric Surgery Source. All rights reserved.
//

import UIKit

var currentIndex:Int = 0
var pageBackIndex:Int = 0
var pageNextIndex:Int = 0

var chapter1 = ["Friedrich Wilhelm Nietzsche (/ˈniːtʃə/[1] German: [ˈfʁiːdʁɪç ˈvɪlhɛlm ˈniːt͡sʃə]; 15 October 1844 – 25 August 1900) was a German philosopher,"," cultural critic, poet, and Latin and Greek scholar whose work has exerted a profound influence on Western"," philosophy and modern intellectual history.[2][3][4][5] Beginning his career as a classical philologist"," before turning to philosophy, he became the youngest-ever occupant of the Chair of Classical Philology at"," the University of Basel in 1869, at age 24. He resigned in 1879 due to health problems that plagued him"," most of his life, and he completed much of his core writing in the following decade.[6] In 1889, at age"," 44, he suffered a collapse and a complete loss of his mental faculties.[7] He lived his remaining"," years in the care of his mother (until her death in 1897) and then his sister Elisabeth Förster-Nietzsche, reworking Nietzsche's unpublished writings to fit her own German nationalist ideology"," while often contradicting or obfuscating his stated opinions, which were explicitly opposed to"," antisemitism and nationalism. Through these published editions, Nietzsche's name became associated ","with fascism and Nazism,[12] although 20th-century scholars have contested this interpretation of his work."," His thought enjoyed renewed popularity in the 1960s, and his ideas have since had a profound impact"," on twentieth and early-twenty-first century thinkers across philosophy—especially in schools"," of continental philosophy such as existentialism, postmodernism, and post-structuralism—as well as art,"," literature, psychology, politics, and popular culture"]

class PageNextBackController: UIPageViewController {
    
    
    var chapterName = String()
    
   
    
    var numberOfPages = 10
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        // The view controllers will be shown in this order
        return [self.newColoredViewController("Current"),
            self.newColoredViewController("Next"),
            self.newColoredViewController("Back")]
    }()
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title  = chapterName
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                direction: .Forward,
                animated: true,
                completion: nil)
        }
    }
    
   private func newColoredViewController(phase: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("PageContent\(phase)")
    }
    
    
    
    
}

// MARK: UIPageViewControllerDataSource

extension PageNextBackController: UIPageViewControllerDataSource {
    
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            
            let previousIndex = viewControllerIndex - 1
            
            // User is on the first view controller and swiped left to loop to
            // the last view controller.
            guard previousIndex >= 0 else {
                return orderedViewControllers.last
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            if currentIndex != 0 {
                currentIndex--
            }
          //  print("This is in Before \(currentIndex)")
            
            return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            // User is on the last view controller and swiped right to loop to
            // the first view controller.
            guard orderedViewControllersCount != nextIndex else {
                return orderedViewControllers.first
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            if currentIndex != numberOfPages {
                currentIndex++
            }
            
            return orderedViewControllers[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    

}
