//
//  NavigationTableViewCell.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/19/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class NavigationTableViewCell: UITableViewCell {

    @IBOutlet weak var pageNameLabel: UILabel!
    @IBOutlet weak var pageIconImage: UIImageView!
    @IBOutlet weak var openImageView: UIImageView!
    
    func setUp(content: NavigationPageCell) {
        pageNameLabel.text = content.title
        pageIconImage.image = UIImage(named: content.imageName)
        openImageView.image = UIImage(named: content.arrowImageName!)
        
        if((content.expandableProperty?.childrenCount)! > 0) {
            openImageView.isHidden = false
        }else{
            openImageView.isHidden = true
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

}
