//
//  AboutUsGetInvolvedView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class AboutUsGetInvolvedView: UIView {
    @IBOutlet weak var pageControl: UIPageControl!
}

extension AboutUsGetInvolvedView: HorizontalPageViewControllerDelegate{
    
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
    
}
