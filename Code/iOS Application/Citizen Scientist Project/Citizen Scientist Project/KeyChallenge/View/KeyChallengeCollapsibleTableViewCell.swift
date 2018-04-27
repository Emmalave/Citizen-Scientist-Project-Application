//
//  KeyChallengeCollapsibleTableViewCell.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class KeyChallengeCollapsibleTableViewCell: UITableViewCell {

    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var subHeaderLabel: UILabel!
    @IBOutlet private weak var bodyTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(content: KeyChallengeTableRow) {
        self.headerLabel.text = content.header
        self.subHeaderLabel.text = content.subHeader
        self.bodyTextView.text = content.bodyText
    }

}
