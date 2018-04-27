//
//  ReefRestorationViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class ReefRestorationViewController: UIViewController {

    @IBAction func openFacebook(_ sender: Any) {
        SocialNetwork.Facebook.openPage()
    }
  
    @IBAction func openTwitter(_ sender: UIButton) {
        SocialNetwork.Twitter.openPage()
    }
    
    @IBAction func openGooglePlus(_ sender: UIButton) {
        SocialNetwork.GooglePlus.openPage()
    }
    
    @IBAction func openYoutube(_ sender: UIButton) {
        SocialNetwork.YouTube.openPage()
    }
    
    @IBAction func openInstagram(_ sender: UIButton) {
        SocialNetwork.Instagram.openPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
}
