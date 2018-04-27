//
//  MiniChallengeView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class MiniChallengeView: UIView {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerLabel1: UILabel!
    @IBOutlet weak var bodyText1: UITextView!
    @IBOutlet weak var downloadiNaturalistButton: UIButton!
    @IBOutlet weak var bodyText2: UITextView!
    @IBOutlet weak var makeAnObservationButton: UIButton!
    @IBOutlet weak var headerLabel2: UILabel!
    @IBOutlet weak var bodyText3: UITextView!
    @IBOutlet weak var headerLabel3: UILabel!
    @IBOutlet weak var headerLabel4: UILabel!
    @IBOutlet weak var bodyText4: UITextView!
    @IBOutlet weak var registerOnlineButton: UIButton!
    
    func setUp(content: MiniChallengeContent){
        headerImageView.image = UIImage(named: content.imageName)
        headerLabel1.text = content.headerLabel1
        bodyText1.text = content.bodyText1
        downloadiNaturalistButton.setTitle(content.downloadiNaturalist.title, for: .normal)
        bodyText2.text = content.bodyText2
        makeAnObservationButton.setTitle(content.makeAnObservation.text, for: .normal)
        headerLabel2.text = content.headerLabel2
        bodyText3.text = content.bodyText3
        headerLabel3.text = content.headerLabel3
        headerLabel4.text = content.headerLabel4
        bodyText4.text = content.bodyText4
        registerOnlineButton.setTitle(content.registerOnline.text, for: .normal)
    }
    
}
