//
//  WaterWatchTableViewCell.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/26/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class WaterWatchTableViewCellChart: UITableViewCell {
    

    @IBOutlet private weak var chartTitle: UILabel!
    @IBOutlet private var chartImageView: UIImageView!
    @IBOutlet weak var legendImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(content: WaterWatchChart){
        chartTitle.text = content.title
        chartImageView.image = UIImage(named: content.chartImage)
        legendImageView.image = UIImage(named: content.legendImage  )
    }
}
