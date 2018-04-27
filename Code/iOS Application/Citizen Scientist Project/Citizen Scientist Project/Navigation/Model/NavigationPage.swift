//
//  NavigationPages.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/5/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit


struct NavigationPageCell {
    var id: Int
    var page: Page
    var parent: Page
    var imageName: String
    var title: String
    var expandableProperty: Expandable?
    var arrowImageName: String?
    
    init(id: Int, page: Page, parent: Page, imageName: String, title: String, arrowImageName: String? = NavigationPageContentManager.DOWN_ARROW_IMAGE_NAME){
        self.id = id
        self.page = page
        self.parent = parent
        self.imageName = imageName
        self.title = title
        self.arrowImageName = arrowImageName
    }
}

class NavigationPage {
    let segueId: String
    
    init(segueId: String){
        self.segueId = segueId
    }
    
    func goTo(sender: UIViewController) {
        sender.performSegue(withIdentifier: segueId, sender: sender)
    }
}

enum Page: String {
    
    private static let seguePrefix = "segueTo"
    
    case Home
    case News
    case Events
    case KeyChallenge
    case ReefRestoration
    case CSPLab
    case Learn
    case Explore
    case Record
    case Review
    case WaterWatch
    case SeaLevelRise
    case LectureSeries
    case FieldActivities
    case OurPartners
    case ContactUs
    case AboutUs
    case Profile
    case GeoHunt
    case OurBiomes
    case NewsLetter
    case Programs
    case Resources
    
    private func page() -> NavigationPage{
        return NavigationPage(segueId: getSegueId(page: self))
    }
    
    private func getSegueId(page: Page) -> String {
        return "\(Page.seguePrefix)\(self.rawValue)"
    }
    
    func goTo(from: UIViewController) {
        self.page().goTo(sender: from)
    }
}
