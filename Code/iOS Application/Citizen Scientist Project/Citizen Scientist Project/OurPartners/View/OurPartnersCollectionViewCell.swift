//
//  OurPartnersCollectionViewCell.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/27/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class OurPartnersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var partnerImageView: UIImageView!
    
    func setUp(cell: OurPartnersCell) {
        partnerImageView.image = UIImage(named: cell.partner.imageName)
    }
}
