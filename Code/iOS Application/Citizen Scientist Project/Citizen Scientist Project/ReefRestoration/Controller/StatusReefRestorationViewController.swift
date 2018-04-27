//
//  StatusReefRestorationViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/22/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class StatusReefRestorationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor  = UIColor(red:0.08, green:0.09, blue:0.15, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.60, green:0.66, blue:0.70, alpha:1.0)
        
        let image : UIImage = UIImage(named: "csp-app-logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
}
