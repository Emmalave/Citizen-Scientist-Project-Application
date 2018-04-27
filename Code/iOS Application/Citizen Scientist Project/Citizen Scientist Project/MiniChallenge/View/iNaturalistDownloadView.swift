//
//  iNaturalistDownloadView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class iNaturalistDownloadView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension iNaturalistDownloadView: iNaturalistDownloadStepsPageVCDelegate{
    
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
    
}
