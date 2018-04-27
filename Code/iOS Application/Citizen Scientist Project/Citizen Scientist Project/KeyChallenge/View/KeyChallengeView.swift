//
//  KeyChallengeView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class KeyChallengeView: UIView {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerLabel1: UILabel!
    @IBOutlet weak var keyChallengeWinnersButton: UIButton!
    @IBOutlet weak var headerLabel2: UILabel!
    @IBOutlet weak var bodyText1: UITextView!
    @IBOutlet weak var reefImageView: UIImageView!
    @IBOutlet weak var bodyText2: UITextView!
    @IBOutlet weak var headerLabel3: UILabel!
    @IBOutlet weak var bodyText3: UITextView!
    @IBOutlet weak var learnMoreMiniChallengeButton: UIButton!
    @IBOutlet weak var headerLabel4: UILabel!
    @IBOutlet weak var downloadKeyChallengeProgramButton: UIButton!
    @IBOutlet weak var issuuImageButton: UIButton!
    @IBOutlet weak var headerLabel5: UILabel!
    @IBOutlet weak var learnMoreRegistrationButton: UIButton!
    @IBOutlet weak var headerLabel6: UILabel!
    @IBOutlet weak var bodyText4: UITextView!
    @IBOutlet weak var garbageImageView: UIImageView!
    @IBOutlet weak var bodyText5: UITextView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    func setUp(content: KeyChallengeContent) {
        headerImageView.image = UIImage(named: content.headerImageName)
        headerLabel1.text = content.headerLabel1
        keyChallengeWinnersButton.setTitle(content.viewKeyChallengeWinners, for: .normal)
        headerLabel2.text = content.headerLabel2
        bodyText1.text = content.bodyText1
        reefImageView.image = UIImage(named: content.reefImageName)
        bodyText2.text = content.bodyText2
        headerLabel3.text = content.headerLabel3
        bodyText3.text = content.bodyText3
        learnMoreMiniChallengeButton.setTitle(content.learnMoreMiniChallenge, for: .normal)
        headerLabel4.text = content.headerLabel4
        downloadKeyChallengeProgramButton.setTitle(content.downloadKeyChallengeProgram.text, for: .normal)
        issuuImageButton.setImage(UIImage(named: content.issuuImageLink.imageName), for: .normal)
        headerLabel5.text = content.headerLabel5
        learnMoreRegistrationButton.setTitle(content.learnMoreRegistration.text, for: .normal)
        headerLabel6.text = content.headerLabel6
        bodyText4.text = content.bodyText4
        garbageImageView.image = UIImage(named: content.garbageImageName)
        bodyText5.text = content.bodyText5
        logoImageView.image = UIImage(named: content.logoImageName)
    }

}
