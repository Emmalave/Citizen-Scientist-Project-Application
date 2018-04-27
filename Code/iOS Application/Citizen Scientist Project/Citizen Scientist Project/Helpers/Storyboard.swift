//
//  Storyboard.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

struct Storyboard {
    
    static let name = "Main"
    
    // MARK: - Homepage
    
    static let cellContentView = "Cell"
    static let sectionFooterView = "FooterView"
    
    static let numberOfSections = 1
    static let numberOfItemsPerRow: CGFloat = 2.0
    static let cellBorderWidth: CGFloat = 1.0
    
    // MARK: - Mini-Challenge
    
    static let MiniChallenge = "MiniChallenge"
    
    static let iNaturalistStepViewController = "iNaturalistDownloadStepViewController"
    static let showiNaturalistDownloadStepsPageVC = "showiNaturalistDownloadStepsPageVC"
    
    static let iNaturalistVimeoTutorialViewController = "iNaturalistVimeoTutorialViewController"
    static let showiNaturalistVimeoTutorialPageVC = "showiNaturalistVimeoTutorialPageVC"
    
    
    // MARK: - About Us
    
    static let AboutUs = "AboutUs"
    
    static let AboutUsExploreViewController = "AboutUsExploreViewController"
    static let segueToAboutUsExploreViewController = "segueToAboutUsExploreViewController"
    
    static let AboutUsGetInvolvedViewController = "AboutUsGetInvolvedViewController"
    static let segueToAboutUsGetInvolvedViewController = "segueToAboutUsGetInvolvedViewController"
    
}
