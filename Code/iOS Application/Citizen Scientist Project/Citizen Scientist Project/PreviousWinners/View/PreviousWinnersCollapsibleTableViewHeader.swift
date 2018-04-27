//
//  PreviousWinnersCollapsibleTableViewHeader.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol PreviousWinnersCollapsibleTableViewHeaderDelegate: class {
    func toggleSection(_ header: PreviousWinnersCollapsibleTableViewHeader, section: Int)
}

class PreviousWinnersCollapsibleTableViewHeader: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    
    var delegate: PreviousWinnersCollapsibleTableViewHeaderDelegate?
    private var section: Int?
    
    override func awakeFromNib() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader(_:))))
        super.awakeFromNib()
    }
    
    func setUp(content: CollapsibleTableHeader) {
        self.titleLabel.text = content.title
        updateArrowDirection(content.collapsed!)
        self.section = content.section
    }
    
    func updateArrowDirection(_ collapsed: Bool) {
        self.arrowImageView.image = UIImage(named: collapsed ? "down-arrow" : "up-arrow")
    }
    
    //MARK: - Trigger toggle section when tapping on the header
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? PreviousWinnersCollapsibleTableViewHeader else {
            return
        }
        
        self.delegate?.toggleSection(self, section: cell.section!)
    }

}
