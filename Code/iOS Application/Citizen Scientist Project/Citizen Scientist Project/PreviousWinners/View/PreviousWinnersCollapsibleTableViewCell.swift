//
//  PreviousWinnersCollapsibleTableViewCell.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class PreviousWinnersCollapsibleTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var winnersTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(content: PreviousWinnersTableRow) {
        self.titleLabel.text = content.header
        var winners = ""
        for winner in content.winners {
            let rank = winner.rank.rawValue
            winners.append("\(rank)\(winner.winners)\n")
        }
        self.winnersTextView.text = winners
    }

}
