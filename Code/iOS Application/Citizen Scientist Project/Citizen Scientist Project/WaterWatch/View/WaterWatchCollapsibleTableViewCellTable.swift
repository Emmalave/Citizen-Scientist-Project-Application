//
//  WaterWatchCollapsibleTableViewCellTable.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/19/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class WaterWatchCollapsibleTableViewCellTable: UITableViewCell {

    @IBOutlet weak var tableImageView: UIImageView!
    
    func setUp(content: WaterWatchTable) {
        tableImageView.image = UIImage(named: content.chartImageName)
    }
    
}
