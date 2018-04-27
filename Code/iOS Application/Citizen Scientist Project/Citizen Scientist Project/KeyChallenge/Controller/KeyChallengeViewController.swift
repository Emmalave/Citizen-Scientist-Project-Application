//
//  KeyChallengeViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol KeyChallengeViewControllerDelegate: class {
    func setContainerHeight(height: CGFloat)
}

class KeyChallengeViewController: UIViewController {

    private let keyChallengeContent: KeyChallengeContent = KeyChallengeContentManager.fetchContent()
    @IBOutlet var keyChallengeView: KeyChallengeView!
    @IBOutlet public weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KeyChallengeCollapsibleTableViewController.delegate = self
        
        if let keyChallengeCollapsibleTableViewController = self.childViewControllers.first as? KeyChallengeCollapsibleTableViewController {
            setContainerHeight(height: keyChallengeCollapsibleTableViewController.tableViewHeight)
        }

        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        keyChallengeView.setUp(content: keyChallengeContent)
    }
    
    //MARK: - Handle Button Click Events
    
    @IBAction func clickDownloadKeyChallengeProgramButton(_ sender: UIButton) {
        ExternalAppManager.openPage(page: keyChallengeContent.downloadKeyChallengeProgram.url)
    }
    @IBAction func clickIssuuPresentationButton(_ sender: UIButton) {
       ExternalAppManager.openPage(page: keyChallengeContent.issuuImageLink.link.url)
    }
    @IBAction func clickLearnMoreRedButton(_ sender: UIButton) {
        ExternalAppManager.openPage(page: keyChallengeContent.learnMoreRegistration.url)
    }
}

extension KeyChallengeViewController: KeyChallengeViewControllerDelegate {
    // Set Container View height constraint to resize depending on its internal table collapsible state
    func setContainerHeight(height: CGFloat) {
        heightConstraint?.constant = height
    }
}
