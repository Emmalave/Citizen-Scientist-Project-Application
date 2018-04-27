//
//  PreviousWinnersView.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class PreviousWinnersView: UIView {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var keyChallengeWinnerImageView: UIImageView!
    @IBOutlet weak var bodyText: UITextView!
    
    
    func setUp(content: PreviousWinnersContent) {
        self.headerImageView.image = UIImage(named: content.headerImageName)
        self.headerLabel.text = content.headerLabel
        self.keyChallengeWinnerImageView.image = UIImage(named: content.winnersImageName)
        self.bodyText.text = content.bodyText
    }

}
