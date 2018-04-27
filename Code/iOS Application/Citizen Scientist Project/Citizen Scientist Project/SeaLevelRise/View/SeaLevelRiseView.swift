//
//  SeaLevelRiseView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/6/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class SeaLevelRiseView: UIView {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerLabel1: UILabel!
    @IBOutlet weak var bodyText1: UITextView!
    @IBOutlet weak var preziButton: UIButton!
    @IBOutlet weak var headerLabel2: UILabel!
    @IBOutlet weak var bodyText2: UITextView!
    @IBOutlet weak var surveyResultButton: UIButton!
    
    func setup(content: SeaLevelRiseContent){
        headerImageView.image = UIImage(named: content.headerImageName)
        headerLabel1.text = content.labelHeader1
        bodyText1.text = content.bodyText1
        preziButton.setImage(UIImage(named: content.preziImage.imageName), for: .normal)
        headerLabel2.text = content.labelHeader2
        bodyText2.text = content.bodyText2
        
        
        // Survey Result button as Link or FileResource ?

        if let surveyResource = content.surveyResource {
            surveyResultButton.setTitle(surveyResource.text, for: .normal)
        }
        else if let surveyLink = content.surveyLink {
            surveyResultButton.setTitle(surveyLink.text, for: .normal)
        }
        
    }
    
}
