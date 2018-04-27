//
//  PreviousWinnersViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/4/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol PreviousWinnersViewControllerDelegate: class {
    func setContainerHeight(height: CGFloat)
}

class PreviousWinnersViewController: UIViewController {

    
    @IBOutlet var previousWinnersView: PreviousWinnersView!
    @IBOutlet public weak var heightConstraint: NSLayoutConstraint!
    
    let previousWinnersContent: PreviousWinnersContent = PreviousWinnersContentManager.fetchContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PreviousWinnersCollapsibleTableViewController.delegate = self
        
        if let previousWinnersCollapsibleTableViewController = self.childViewControllers.first as? PreviousWinnersCollapsibleTableViewController {
            setContainerHeight(height: previousWinnersCollapsibleTableViewController.tableViewHeight)
        }
        
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        previousWinnersView.setUp(content: previousWinnersContent)
    }

}

extension PreviousWinnersViewController: PreviousWinnersViewControllerDelegate {
    // Set Container View height constraint to resize depending on its internal table collapsible state
    func setContainerHeight(height: CGFloat) {
        heightConstraint?.constant = height
    }
}
