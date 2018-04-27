//
//  WaterWatchViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol WaterWatchContainerViewDelegate: class {
    func setContainerHeight(height: CGFloat)
}

//TODO: create an extension with implementation
class WaterWatchViewController: UIViewController {
    
    @IBOutlet weak var waterWatchView: WaterWatchView!
    
    @IBOutlet public weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var collapsibleTableView: UIView!
    
    let waterWatchContent = WaterWatchContentManager.fetchContentData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollapsibleTableViewController.delegate = self
        
        if let collapsibleTableViewController = self.childViewControllers.first as? CollapsibleTableViewController {
            setContainerHeight(height: collapsibleTableViewController.tableViewHeight)
        }
        
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        waterWatchView.setUp(content: waterWatchContent)
    }
    
    @IBAction func clickLearnMoreButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.learnMore.url, options: [:], completionHandler: nil)
    }
    @IBAction func clickDissolvedOxygenButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.dissolvedOxygen.url, options: [:], completionHandler: nil)
    }
    @IBAction func clickNutrientsButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.nutrients.url, options: [:], completionHandler: nil)
    }
    @IBAction func clickChlorophyllButton(_ sender: UIButton) {
        UIApplication.shared.open(waterWatchContent.chlorophyllA.url, options: [:], completionHandler: nil)
    }
    
}

// MARK: - WaterWatchContainerViewDelegate

extension WaterWatchViewController: WaterWatchContainerViewDelegate {
    // Set Container View height constraint to resize depending on its internal table collapsible state
    func setContainerHeight(height: CGFloat) {
        heightConstraint?.constant = height
    }
}

