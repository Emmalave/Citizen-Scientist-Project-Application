//
//  iNaturalistVimeoTutorialView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class iNaturalistVimeoTutorialView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension iNaturalistVimeoTutorialView: iNaturalistVimeoTutorialsPageVCDelegate{
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
    
    
}
