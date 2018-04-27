//
//  WaterWatchView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class WaterWatchView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headerLabel1: UILabel!
    @IBOutlet weak var biscayneBayWaterWatchLogo: UIImageView!
    @IBOutlet weak var bodyTextView1: UITextView!
    @IBOutlet weak var headerLabel2: UILabel!
    @IBOutlet weak var bodyTextView2: UITextView!
    
    @IBOutlet weak var learnMoreLinkButton: UIButton!
    @IBOutlet weak var dissolvedOxygenLinkButton: UIButton!
    @IBOutlet weak var nutrientsLinkButton: UIButton!
    @IBOutlet weak var chlorophyllALinkButton: UIButton!
    
    func setUp(content: WaterWatchContent)
    {
        imageView.image = UIImage(named: content.imageName)
        biscayneBayWaterWatchLogo.image = UIImage(named: content.biscayneBayLogoImageName)
        
        headerLabel1.text = content.headerLabel1
        headerLabel2.text = content.headerLabel2
        bodyTextView1.text = content.bodyText1
        bodyTextView2.text = content.bodyText2
        
        learnMoreLinkButton.setTitle(content.learnMore.text, for: .normal)
        dissolvedOxygenLinkButton.setTitle(content.dissolvedOxygen.text, for: .normal)
        nutrientsLinkButton.setTitle(content.nutrients.text, for: .normal)
        chlorophyllALinkButton.setTitle(content.chlorophyllA.text, for: .normal)
        
    }
}

