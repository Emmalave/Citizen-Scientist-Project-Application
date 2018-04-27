//
//  FieldActivityViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class FieldActivityViewController: UIViewController {

    
    @IBAction func clickLearnMoreButton(_ sender: UIButton) {
        ExternalAppManager.openPage(page: "http://www.keyscience.org/events/")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }

}
