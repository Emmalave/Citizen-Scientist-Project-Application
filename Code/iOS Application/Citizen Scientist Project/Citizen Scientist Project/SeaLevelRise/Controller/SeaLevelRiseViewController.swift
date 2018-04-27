//
//  SeaLevelRiseViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/21/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class SeaLevelRiseViewController: UIViewController {

    let seaLevelRiseContent = SeaLevelRiseContentManager.fetchContent()
    
    @IBOutlet var seaLevelRiseView: SeaLevelRiseView!
    
    var delegate: WebViewControllerDelegate?
    
    @IBAction func surveyResultsButtonPressed(_ sender: UIButton) {
        
        // Check if file resource exists. If it exists display it within the the app using a webview, else launch default web browser and go to link provided by the SeaLevelRiseContentManager
        
        if let surveyResource = seaLevelRiseContent.surveyResource, let _ = Bundle.main.path(forResource: surveyResource.resource, ofType: surveyResource.fileType.rawValue) {
            performSegue(withIdentifier: WebViewController.segueId, sender: self)
        }
        else if let surveyLink = seaLevelRiseContent.surveyLink {
            ExternalAppManager.openPage(page: surveyLink.url.absoluteString)
        }
    }
    
    // Prezi Presentation
    @IBAction func preziPresentationButtonPressed(_ sender: UIButton) {
        let page = seaLevelRiseContent.preziImage.link.url.absoluteString
        ExternalAppManager.openPage(page: page)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        seaLevelRiseView.setup(content: seaLevelRiseContent)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == WebViewController.segueId{
            if let webViewController = segue.destination as? WebViewController{
                delegate = webViewController
                delegate?.loadResource(resource: (seaLevelRiseContent.surveyResource?.resource)!, type: (seaLevelRiseContent.surveyResource?.fileType.rawValue)!)
            }
        }
    }
    
}
