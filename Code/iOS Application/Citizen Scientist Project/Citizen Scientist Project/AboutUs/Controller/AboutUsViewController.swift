//
//  AboutUsViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var aboutUsExploreView: AboutUsExploreView!
    @IBOutlet weak var aboutUsGetInvolvedView: AboutUsGetInvolvedView!
    
    @IBOutlet weak var exploreViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var getInvolvedViewHeightConstraint: NSLayoutConstraint!
    
    
    @IBAction func clickLabFullSiteButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.keyscience.org")!, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.translatesAutoresizingMaskIntoConstraints = false
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
    
    // MARK: - Explore and Get Involved Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.segueToAboutUsExploreViewController{
            if let AboutUsExplorePageVC = segue.destination as? AboutUsExplorePageViewController {
                AboutUsExplorePageVC.pageViewControllerDelegate = aboutUsExploreView
            }
        }
        
        if segue.identifier == Storyboard.segueToAboutUsGetInvolvedViewController{
            if let AboutUsGetInvolvedPageVC = segue.destination as? AboutUsGetInvolvedPageViewController{
                AboutUsGetInvolvedPageVC.pageViewControllerDelegate = aboutUsGetInvolvedView
            }
        }
        
    }
    
    // MARK: - Handle Click To Sponsors' Website
    
    
    // TODO: Use model instead of hardcode urls
    @IBAction func clickKBCFLogoButton(_ sender: UIButton) {
        ExternalAppManager.openPage(page: "http://www.kbcf.org")
    }
    @IBAction func clickVillageLogoButton(_ sender: UIButton) {
        ExternalAppManager.openPage(page: "http://keybiscayne.fl.gov")
    }
    @IBAction func clickUMLogoButton(_ sender: UIButton) {
        ExternalAppManager.openPage(page: "http://www.rsmas.miami.edu")
    }
    @IBAction func clickKnightLogoButton(_ sender: UIButton) {
        ExternalAppManager.openPage(page: "https://knightfoundation.org")
    }
    

}
