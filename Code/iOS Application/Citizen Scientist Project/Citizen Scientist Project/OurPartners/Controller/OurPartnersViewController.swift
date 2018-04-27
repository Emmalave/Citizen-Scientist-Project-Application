//
//  OurPartnersViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol OurPartnersContainerViewDelegate: class {
    func setContainerHeight(height: CGFloat, partner: Partners)
}


class OurPartnersViewController: UIViewController {

    private let ourPartnersContent: OurPartnersContent = OurPartnersContentManager.fetchContent()
    
    @IBOutlet var ourPartnersView: OurPartnersView!
    @IBOutlet public weak var firstPartnersHeightConstraint: NSLayoutConstraint!
    @IBOutlet public weak var secondPartnersHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OurPartnersFirstCollectionViewController.heightDelegate = self
        OurPartnersSecondCollectionViewController.heightDelegate = self
        
        ourPartnersView.setUp(content: ourPartnersContent)
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }

}

extension OurPartnersViewController: OurPartnersContainerViewDelegate {
    func setContainerHeight(height: CGFloat, partner: Partners) {
        switch(partner) {
            case .First: firstPartnersHeightConstraint?.constant = height
            case .Second: secondPartnersHeightConstraint?.constant = height
            default: print("Not supported")
        }
    }
    
    
}
