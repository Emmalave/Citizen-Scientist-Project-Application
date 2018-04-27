//
//  Header.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/31/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

class ReusableHeader {
    
    static func setUpNavBar(navigationController: UINavigationController?, navigationItem: UINavigationItem?){
        navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor  = UIColor(red:0.08, green:0.09, blue:0.15, alpha:1.0)
        navigationController?.navigationBar.tintColor = UIColor(red:0.60, green:0.66, blue:0.70, alpha:1.0)
        
        
        let image : UIImage = UIImage(named: "csp-app-logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem?.titleView = imageView
    }
    
}


