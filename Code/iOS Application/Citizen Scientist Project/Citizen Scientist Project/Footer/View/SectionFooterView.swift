//
//  SectionFooterView.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class SectionFooterView: UICollectionReusableView {
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var googlePlusButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var footerLabel: UILabel!
    
    func setup(content: FooterSection){
        
        footerLabel.text = content.title
        
        facebookButton.setImage(UIImage(named: FooterIcon.Facebook.rawValue), for: .normal)
        twitterButton.setImage(UIImage(named: FooterIcon.Twitter.rawValue), for: .normal)
        googlePlusButton.setImage(UIImage(named: FooterIcon.GooglePlus.rawValue), for: .normal)
        youtubeButton.setImage(UIImage(named: FooterIcon.Youtube.rawValue), for: .normal)
        instagramButton.setImage(UIImage(named: FooterIcon.Instagram.rawValue), for: .normal)
    }
    
}
