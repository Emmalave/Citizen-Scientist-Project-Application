//
//  ReusableFooterViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/5/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class ReusableFooterViewController: UIViewController {

    var footerSection: FooterSection = Footer.fetchData()
    
    @IBOutlet weak var footerView: SectionFooterView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        footerView?.setup(content: footerSection)
    }
    
    @IBAction func openFacebook(_ sender: UIButton) {
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
    

}
