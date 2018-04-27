//
//  WaterWatchTableViewHeaderCell.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/26/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: WaterWatchTableViewHeaderCell, section: Int)
}

class WaterWatchTableViewHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int?
    
    override func awakeFromNib() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader(_:))))
        super.awakeFromNib()
    }
    
    func setUp(content: WaterWatchSection, section: Int){
        titleLabel.text = content.header
        self.section = section
        updateArrowDirection(content.collapsed)
    }
    
    func updateArrowDirection(_ collapsed: Bool) {
        self.arrowImageView.image = UIImage(named: collapsed ? "down-arrow" : "up-arrow")
    }
    
    
    //MARK: - Trigger toggle section when tapping on the header
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? WaterWatchTableViewHeaderCell else {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section!)
    }
    
}
