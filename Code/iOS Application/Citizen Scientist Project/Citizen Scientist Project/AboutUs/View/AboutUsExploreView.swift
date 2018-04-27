//
//  AboutUsExploreView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class AboutUsExploreView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension AboutUsExploreView: HorizontalPageViewControllerDelegate{
    
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
    
}
